
set PATH=%PATH%;"E:\Docencia\Material_Moduls\M9_DIW\material_curs\UFO2\video\01_programes de conversio\ffmpeg\binaris"

set INPUT=frag.mkv

ffprobe %INPUT%
pause
rem =============================================================
set LQ_BITRATE=1M
set SIZE=712x400
rem versions  qualitat normal
ffmpeg -i %INPUT% -c:v h264 -c:a aac -b:v %LQ_BITRATE% -s %SIZE% output_LQ.mp4
ffmpeg -i %INPUT% -c:v vp8 -c:a libopus -b:v %LQ_BITRATE%  -s %SIZE% output_LQ.webm

rem =============================================================
set HQ_BITRATE=15M
rem versions d'alta qualitat
ffmpeg -i %INPUT% -c:v hevc -c:a aac -b:v %HQ_BITRATE%  output_HQ_hevc.mp4
ffmpeg -i %INPUT% -c:v libaom-av1 -c:a libopus -b:v %HQ_BITRATE%  output_HQ_av1.webm
ffmpeg -i %INPUT% -c:v h264 -c:a aac -b:v %HQ_BITRATE% output_HQ_avc.mp4
ffmpeg -i %INPUT% -c:v vp8 -c:a libopus -b:v %HQ_BITRATE%  output_HQ_vp8.webm
pause
