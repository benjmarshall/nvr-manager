# NVR Manager
Simple bash script using inotify to watch for segmented mp4 files from ffmpeg and organize them into folders.

Running ffmpeg like this will produce compatible segments:
```
ffmpeg -rtsp_transport tcp -i rtsp://192.168.1.100:554/live -f segment -segment_time 60 -segment_format mp4 -reset_timestamps 1 -strftime 1 -c copy -an -map 0 camera-%Y%m%d%H%M%S.mp4
```

To build the docker image on Hassos, clone this repository and use something like this:
```
docker build -t benmarshall/nvr-manager .
```

To run the container use something like this:
```
docker run \
-d \
--restart=unless-stopped \
--name nvr-manager \
-v /mnt/data/supervisor/media/frigate:/clips \
-e MONITORDIR="/clips" \
benmarshall/nvr-manager:latest
```
