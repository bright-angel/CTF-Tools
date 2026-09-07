# 音频视频分析工具

音频和视频文件的分析、隐写检测工具。

## 在线工具

### 音频分析

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| AudioMass | [https://audiomass.co/](https://audiomass.co/) | 在线音频编辑器 |
| Online Tone Generator | [https://onlinetonegenerator.com/](https://onlinetonegenerator.com/) | 音频生成分析 |
| DTMF Decoder | [https://dtmf.netlify.app/](https://dtmf.netlify.app/) | 拨号音解码 |
| Morse Audio Decoder | [https://morsecode.world/international/decoder/audio-decoder-adaptive.html](https://morsecode.world/international/decoder/audio-decoder-adaptive.html) | 摩尔斯音频解码 |

### 频谱分析

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| Spectrum Analyzer | [https://www.audiocheck.net/audiofrequencysignalgenerator_sinetone.php](https://www.audiocheck.net/audiofrequencysignalgenerator_sinetone.php) | 音频频谱 |

## 离线工具

### 音频分析工具

#### Audacity

**下载链接**:
```
https://www.audacityteam.org/download/
```

**安装**:
```bash
# Windows: 下载安装包
# macOS: brew install --cask audacity
# Ubuntu: sudo apt install audacity
```

**基本使用**:
```
1. 导入音频: File -> Open

2. 查看波形
   - 正常波形视图
   - 查看异常波动
   - 可能隐藏摩尔斯电码

3. 查看频谱图
   - Analyze -> Plot Spectrum (频谱分析)
   - View -> Spectrogram (频谱图)
   - 可能隐藏文字/图像

4. 分离声道
   - 点击音轨名称 -> Split Stereo to Mono
   - 左右声道可能包含不同信息

5. 效果处理
   - Effect -> Reverse (反转)
   - Effect -> Change Speed (变速)
   - Effect -> Change Pitch (变调)
   - Effect -> Amplify (放大)

6. 导出: File -> Export
```

**CTF常用技巧**:
```
1. 摩尔斯电码
   - 波形图看长短音
   - 手动识别或录音后在线识别

2. DTMF拨号音
   - 双音多频
   - 使用DTMF解码器

3. SSTV慢扫描电视
   - 频谱图中可能有图像
   - 使用QSSTV/RX-SSTV解码

4. 频谱隐写
   - 切换到频谱图视图
   - 调整对比度和颜色方案
   - 可能显示文字或二维码

5. 立体声隐写
   - 左右声道不同
   - 相位差异
```

#### Sonic Visualiser

**下载链接**:
```
https://www.sonicvisualiser.org/download.html
```

**功能**:
- 波形和频谱可视化
- 时域/频域分析
- 插件系统
- 更专业的音频分析

**使用**:
```
1. File -> Open Audio File
2. Layer -> Add Spectrogram
3. 调整显示参数
4. Pane -> Add New Pane (多视图对比)
```

#### FFmpeg音频处理

**下载链接**:
```
https://ffmpeg.org/download.html
```

**音频提取**:
```bash
# 从视频提取音频
ffmpeg -i video.mp4 -vn -acodec copy audio.aac

# 转换格式
ffmpeg -i audio.mp3 audio.wav

# 查看信息
ffmpeg -i audio.mp3

# 提取特定时间段
ffmpeg -i audio.mp3 -ss 00:00:10 -t 00:00:05 segment.mp3

# 分离声道
ffmpeg -i stereo.wav -filter_complex "[0:a]channelsplit=channel_layout=stereo[left][right]" -map "[left]" left.wav -map "[right]" right.wav

# 音频反转
ffmpeg -i audio.wav -af areverse reversed.wav

# 变速不变调
ffmpeg -i audio.wav -filter:a "atempo=2.0" faster.wav

# 生成频谱图
ffmpeg -i audio.mp3 -lavfi showspectrumpic=s=1920x1080 spectrogram.png
```

#### Python音频处理

**安装**:
```bash
pip install pydub numpy scipy matplotlib
```

**基本处理**:
```python
from pydub import AudioSegment
import numpy as np
import matplotlib.pyplot as plt
from scipy.io import wavfile

# 读取音频
audio = AudioSegment.from_file("audio.mp3")

# 基本信息
print(f"时长: {len(audio)}ms")
print(f"声道数: {audio.channels}")
print(f"采样率: {audio.frame_rate}Hz")
print(f"采样宽度: {audio.sample_width}字节")

# 转换格式
audio.export("output.wav", format="wav")

# 分离声道
if audio.channels == 2:
    left, right = audio.split_to_mono()
    left.export("left.wav", format="wav")
    right.export("right.wav", format="wav")

# 反转音频
reversed_audio = audio.reverse()
reversed_audio.export("reversed.wav", format="wav")

# 变速
faster = audio.speedup(playback_speed=2.0)
slower = audio.speedup(playback_speed=0.5)

# 音量调整
louder = audio + 10  # 增加10dB
quieter = audio - 10  # 减少10dB

# 切片
segment = audio[10000:20000]  # 10-20秒
```

**频谱分析**:
```python
import numpy as np
import matplotlib.pyplot as plt
from scipy.io import wavfile
from scipy import signal

def plot_spectrogram(wav_file):
    """绘制频谱图"""
    # 读取wav文件
    sample_rate, samples = wavfile.read(wav_file)
    
    # 如果是立体声，只取一个声道
    if len(samples.shape) > 1:
        samples = samples[:, 0]
    
    # 计算频谱图
    frequencies, times, spectrogram = signal.spectrogram(samples, sample_rate)
    
    # 绘制
    plt.figure(figsize=(12, 6))
    plt.pcolormesh(times, frequencies, 10 * np.log10(spectrogram), shading='gouraud')
    plt.ylabel('Frequency [Hz]')
    plt.xlabel('Time [sec]')
    plt.colorbar(label='Power [dB]')
    plt.title('Spectrogram')
    plt.savefig('spectrogram.png', dpi=300, bbox_inches='tight')
    plt.show()

def extract_lsb_audio(wav_file):
    """提取音频LSB"""
    sample_rate, samples = wavfile.read(wav_file)
    
    if len(samples.shape) > 1:
        samples = samples[:, 0]
    
    # 提取最低位
    lsb_data = samples & 1
    
    # 转换为字节
    bits = ''.join(str(bit) for bit in lsb_data)
    
    # 每8位转一个字节
    result = []
    for i in range(0, len(bits), 8):
        byte = bits[i:i+8]
        if len(byte) == 8:
            result.append(chr(int(byte, 2)))
    
    return ''.join(result)

# 使用
plot_spectrogram('audio.wav')
hidden_data = extract_lsb_audio('audio.wav')
print(hidden_data)
```

**DTMF解码**:
```python
import numpy as np
from scipy.io import wavfile

# DTMF频率表
DTMF_FREQS = {
    (697, 1209): '1', (697, 1336): '2', (697, 1477): '3', (697, 1633): 'A',
    (770, 1209): '4', (770, 1336): '5', (770, 1477): '6', (770, 1633): 'B',
    (852, 1209): '7', (852, 1336): '8', (852, 1477): '9', (852, 1633): 'C',
    (941, 1209): '*', (941, 1336): '0', (941, 1477): '#', (941, 1633): 'D',
}

def decode_dtmf(wav_file):
    """DTMF解码（简化版）"""
    sample_rate, samples = wavfile.read(wav_file)
    
    if len(samples.shape) > 1:
        samples = samples[:, 0]
    
    # 分段分析
    segment_length = int(0.1 * sample_rate)  # 100ms
    
    digits = []
    for i in range(0, len(samples), segment_length):
        segment = samples[i:i+segment_length]
        
        # FFT分析
        fft = np.fft.fft(segment)
        freqs = np.fft.fftfreq(len(segment), 1/sample_rate)
        
        # 查找峰值频率
        # 这里需要更复杂的峰值检测算法
        # 简化版本省略
        
    return ''.join(digits)
```

### 视频分析工具

#### FFmpeg视频处理

**提取帧**:
```bash
# 提取所有帧
ffmpeg -i video.mp4 frames/frame_%04d.png

# 提取特定帧率
ffmpeg -i video.mp4 -vf fps=1 frames/frame_%04d.png

# 提取第N帧
ffmpeg -i video.mp4 -vf "select=eq(n\,100)" -vframes 1 frame_100.png

# 提取关键帧
ffmpeg -i video.mp4 -vf "select='eq(pict_type\,I)'" -vsync vfr keyframes/frame_%04d.png
```

#### Python视频处理

**安装**:
```bash
pip install opencv-python
```

**基本操作**:
```python
import cv2

# 打开视频
cap = cv2.VideoCapture('video.mp4')

# 视频信息
fps = cap.get(cv2.CAP_PROP_FPS)
frame_count = int(cap.get(cv2.CAP_PROP_FRAME_COUNT))
width = int(cap.get(cv2.CAP_PROP_FRAME_WIDTH))
height = int(cap.get(cv2.CAP_PROP_FRAME_HEIGHT))

print(f"FPS: {fps}")
print(f"总帧数: {frame_count}")
print(f"分辨率: {width}x{height}")

# 提取所有帧
frame_num = 0
while True:
    ret, frame = cap.read()
    if not ret:
        break
    
    cv2.imwrite(f'frames/frame_{frame_num:04d}.png', frame)
    frame_num += 1

cap.release()

# 提取特定帧
cap = cv2.VideoCapture('video.mp4')
cap.set(cv2.CAP_PROP_POS_FRAMES, 100)  # 跳到第100帧
ret, frame = cap.read()
if ret:
    cv2.imwrite('frame_100.png', frame)
cap.release()
```

## CTF解题技巧

!!! tip "音频隐写识别"
    ```
    1. 波形异常
       - 长短波形 → 摩尔斯电码
       - 规律波动 → DTMF拨号音
       - 查看波形图
    
    2. 频谱异常
       - 频谱图中的文字/图像
       - SSTV图像信号
       - 查看频谱图（Spectrogram）
    
    3. 立体声差异
       - 左右声道不同
       - 分离后分别分析
    
    4. LSB隐写
       - 音频样本最低位
       - 提取后转文本/图片
    
    5. 元数据
       - ID3标签
       - 注释字段
    ```

!!! tip "Audacity使用流程"
    ```
    1. 打开音频文件
    
    2. 波形分析
       - 查看整体波形
       - 寻找异常区域
       - 放大查看细节
    
    3. 频谱分析
       - Analyze -> Plot Spectrum
       - View -> Spectrogram
       - 调整窗口大小和颜色方案
    
    4. 声道分离
       - Split Stereo to Mono
       - 分别分析左右声道
    
    5. 效果处理
       - 反转、变速、变调
       - 放大微弱信号
    
    6. 导出处理后的音频
    ```

!!! tip "频谱图技巧"
    ```
    在Audacity中:
    1. 选择音轨
    2. 点击音轨名称旁的下拉菜单
    3. 选择 Spectrogram
    4. 调整参数:
       - Window Size (窗口大小)
       - Zero padding factor
       - Color scheme (颜色方案)
    
    寻找:
    - 水平线条 → 纯音调
    - 文字/图案 → 频谱隐写
    - 二维码 → 扫描识别
    ```

!!! tip "摩尔斯电码识别"
    ```
    特征:
    - 长短两种音调
    - 规律间隔
    
    解码:
    1. 波形图手动识别
       - 短音: .
       - 长音: -
       - 间隔: 空格
    
    2. 自动识别
       - 录音后上传到在线工具
       - https://morsecode.world/
    
    3. 编码表
       A: .-    N: -.
       B: -...  O: ---
       E: .     T: -
       S: ...
    ```

!!! tip "DTMF解码"
    ```
    特征:
    - 双音多频
    - 电话拨号音
    
    解码:
    1. 在线工具
       - https://dtmf.netlify.app/
    
    2. Audacity
       - Analyze -> Plot Spectrum
       - 识别频率峰值
    
    频率对应:
    1: 697+1209 Hz
    2: 697+1336 Hz
    3: 697+1477 Hz
    ...
    ```

!!! tip "SSTV解码"
    ```
    慢扫描电视信号
    
    特征:
    - 频谱图中有彩色条纹
    - 规律的频率变化
    
    解码工具:
    - MMSSTV (Windows)
    - QSSTV (Linux)
    - RX-SSTV (macOS)
    
    步骤:
    1. 安装SSTV软件
    2. 播放音频
    3. 软件自动解码图像
    ```

!!! tip "视频帧分析"
    ```
    1. 提取所有帧
       ffmpeg -i video.mp4 frames/frame_%04d.png
    
    2. 查找异常帧
       - 一帧闪过的文字
       - 隐藏信息
       - 二维码
    
    3. 关键帧分析
       - I帧（关键帧）
       - 可能包含隐藏信息
    
    4. 帧间差异
       - 计算连续帧的差异
       - 可能显示隐藏内容
    ```

!!! warning "常见问题"
    ```
    1. Audacity无法打开音频
       - 转换为WAV格式
       - ffmpeg -i audio.mp3 audio.wav
    
    2. 频谱图看不清
       - 调整窗口大小
       - 更改颜色方案
       - 增加分辨率
    
    3. 声道分离失败
       - 确认是立体声
       - 重新导入音频
    
    4. LSB提取全是乱码
       - 可能不是LSB隐写
       - 尝试不同位数
       - 检查字节序
    ```

!!! tip "工具组合使用"
    ```
    标准流程:
    1. FFmpeg提取音频
    2. Audacity波形分析
    3. Sonic Visualiser频谱分析
    4. Python脚本自动化处理
    5. 在线工具验证
    ```

## 相关资源

- **Audacity**: 免费开源音频编辑器
- **Sonic Visualiser**: 专业音频分析工具
- **FFmpeg**: 万能音视频处理工具
- **QSSTV**: SSTV解码器
- **Python pydub**: 音频处理库
