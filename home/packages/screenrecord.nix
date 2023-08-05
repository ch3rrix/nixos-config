{ pkgs, config, ... }: {
  home.packages = [
    (pkgs.writers.writeDashBin "screenrecord" ''
      PID_FILE="/tmp/screencast.pid"
      SCREENCAST_FILE="/tmp/screencast.mp4"

      if [ -e $PID_FILE ]; then
          kill -s INT "$(cat $PID_FILE)"
          mat2 --inplace "$SCREENCAST_FILE"
          dragon -T "$SCREENCAST_FILE"
          rm -- "$PID_FILE"
      else
          geometry=$(slop -c 0.7411764705882353,0.5764705882352941,0.9764705882352941,0.1 \
                     -b 1 -o -D -f "-video_size %wx%h -i :0.0+%x,%y")
          #shellcheck disable=SC2181
          if [ $? -eq 0 ] ;then
              test -f ~/.dummy.aac || ffmpeg -f lavfi -i anullsrc=r=48000:cl=mono -t 1 -acodec aac ~/.dummy.aac
              #shellcheck disable=SC2086
              ffmpeg -y -thread_queue_size 65536 \
              -f x11grab $geometry -i ~/.dummy.aac -c:a copy \
              -c:v libx264 -vf "scale=force_original_aspect_ratio=decrease:force_divisible_by=2" -preset slow -crf 21 -pix_fmt yuv420p \
              -fflags +bitexact -flags:v +bitexact -flags:a +bitexact \
              "$SCREENCAST_FILE" >/dev/null 2>/dev/null &
              echo $! > $PID_FILE
              notify-send "screenrecording started"
          else
              notify-send "screenrecording was canceled"
          fi
      fi
    '')
  ];
}
