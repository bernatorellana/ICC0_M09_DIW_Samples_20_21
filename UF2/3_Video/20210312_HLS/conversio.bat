
set PATH=%PATH%;"E:\Docencia\Material_Moduls\M9_DIW\material_curs\UFO2\video\01_programes de conversio\ffmpeg\binaris"

set FRAG=frag

set INPUT=frag.mkv

set INDEX_FILE=sortida.m3u8

ffprobe %INPUT%
pause
rem  ==== Creem la carpeta on es generaran els fragments ======================
mkdir %FRAG%
rem =======================================
rem ffmpeg -i %INPUT% -vf scale=w=1280:h=720:force_original_aspect_ratio=decrease -c:a aac -ar 48000 -b:a 128k -c:v h264 -profile:v main -crf 20 -g 48 -keyint_min 48 -sc_threshold 0 -b:v 2500k -maxrate 2675k -bufsize 3750k -hls_time 4 -hls_playlist_type vod -hls_segment_filename %FRAG%/720p_%%03d.ts %FRAG%/720p.m3u8



rem =======================================

ffmpeg -hide_banner -y -i %INPUT% ^
  -vf scale=w=640:h=trunc(ow/a/2)*2 -c:a aac -ar 48000 -c:v h264 -profile:v main -crf 20 -sc_threshold 0 -g 48 -keyint_min 48 ^ -hls_time 4 -hls_playlist_type vod  -b:v 800k -maxrate 856k -bufsize 1200k -b:a 96k -hls_segment_filename %FRAG%/360p_%%03d.ts %FRAG%/360p.m3u8 ^
  -vf scale=w=842:h=trunc(ow/a/2)*2 -c:a aac -ar 48000 -c:v h264 -profile:v main -crf 20 -sc_threshold 0 -g 48 -keyint_min 48 ^ -hls_time 4 -hls_playlist_type vod -b:v 1400k -maxrate 1498k -bufsize 2100k -b:a 128k -hls_segment_filename %FRAG%/480p_%%03d.ts %FRAG%/480p.m3u8 ^
  -vf scale=w=1280:h=trunc(ow/a/2)*2 -c:a aac -ar 48000 -c:v h264 -profile:v main -crf 20 -sc_threshold 0 -g 48 -keyint_min 48 ^ -hls_time 4 -hls_playlist_type vod -b:v 2800k -maxrate 2996k -bufsize 4200k -b:a 128k -hls_segment_filename %FRAG%/720p_%%03d.ts %FRAG%/720p.m3u8 ^
  -vf scale=w=1920:h=trunc(ow/a/2)*2 -c:a aac -ar 48000 -c:v h264 -profile:v main -crf 20 -sc_threshold 0 -g 48 -keyint_min 48 ^ -hls_time 4 -hls_playlist_type vod -b:v 5000k -maxrate 5350k -bufsize 7500k -b:a 192k -hls_segment_filename %FRAG%/1080p_%%03d.ts %FRAG%/1080p.m3u8


echo #EXTM3U>> %INDEX_FILE%
echo #EXT-X-VERSION:3>> %INDEX_FILE%
echo #EXT-X-STREAM-INF:BANDWIDTH=800000,RESOLUTION=640x360>> %INDEX_FILE%
echo %FRAG%/360p.m3u8>> %INDEX_FILE%
echo #EXT-X-STREAM-INF:BANDWIDTH=1400000,RESOLUTION=842x480>> %INDEX_FILE%
echo %FRAG%/480p.m3u8>> %INDEX_FILE%
echo #EXT-X-STREAM-INF:BANDWIDTH=2800000,RESOLUTION=1280x720>> %INDEX_FILE%
echo %FRAG%/720p.m3u8>> %INDEX_FILE%
echo #EXT-X-STREAM-INF:BANDWIDTH=5000000,RESOLUTION=1920x1080>> %INDEX_FILE%
echo %FRAG%/1080p.m3u8>> %INDEX_FILE%

  
  

pause