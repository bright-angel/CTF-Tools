# 图片处理工具

图片隐写、处理、分析相关工具。

## 在线工具

### 图片隐写分析

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| StegOnline | [https://stegonline.georgeom.net/upload](https://stegonline.georgeom.net/upload) | LSB分析、位平面 |
| Aperi'Solve | [https://www.aperisolve.com/](https://www.aperisolve.com/) | 自动化隐写检测 |
| Forensically | [https://29a.ch/photo-forensics/](https://29a.ch/photo-forensics/) | 图片取证分析 |
| FotoForensics | [https://fotoforensics.com/](https://fotoforensics.com/) | ELA分析 |

### 图片格式转换

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| Convertio | [https://convertio.co/zh/image-converter/](https://convertio.co/zh/image-converter/) | 多格式转换 |
| Online Convert | [https://www.online-convert.com/](https://www.online-convert.com/) | 图片转换 |
| CloudConvert | [https://cloudconvert.com/](https://cloudconvert.com/) | 在线转换工具 |

### 图片Base64

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| Base64 Image | [https://www.base64-image.de/](https://www.base64-image.de/) | 图片Base64互转 |
| Image to Base64 | [https://codebeautify.org/image-to-base64-converter](https://codebeautify.org/image-to-base64-converter) | 图片编码 |

### 二维码工具

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| QRazyBox | [https://merricx.github.io/qrazybox/](https://merricx.github.io/qrazybox/) | 二维码修复分析 |
| CLI QR | [https://cli.im/](https://cli.im/) | 二维码生成识别 |

### 图片拼接

| 工具名称 | 链接 | 功能 |
|---------|------|------|
| IMGonline | [https://www.imgonline.com.ua/eng/combine-two-images-into-one.php](https://www.imgonline.com.ua/eng/combine-two-images-into-one.php) | 图片拼接 |

## 离线工具

### Python图片处理库

#### Pillow (PIL)

**安装**:
```bash
pip install Pillow
```

**基本使用**:
```python
from PIL import Image
import numpy as np

# 打开图片
img = Image.open('image.png')

# 基本信息
print(f"格式: {img.format}")
print(f"模式: {img.mode}")
print(f"大小: {img.size}")

# 获取像素
pixels = img.load()
r, g, b = pixels[0, 0]  # 获取(0,0)位置的RGB值

# 修改像素
pixels[0, 0] = (255, 0, 0)  # 设置为红色

# 保存图片
img.save('output.png')

# 转换模式
img_gray = img.convert('L')  # 转灰度
img_rgba = img.convert('RGBA')  # 转RGBA

# 调整大小
img_resized = img.resize((800, 600))

# 裁剪
img_cropped = img.crop((0, 0, 100, 100))  # (left, top, right, bottom)

# 旋转
img_rotated = img.rotate(90)

# 翻转
img_flipped_lr = img.transpose(Image.FLIP_LEFT_RIGHT)  # 水平翻转
img_flipped_tb = img.transpose(Image.FLIP_TOP_BOTTOM)  # 垂直翻转
```

#### LSB隐写提取

**Python实现**:
```python
from PIL import Image

def extract_lsb(image_path, output_file, bits=1):
    """提取LSB隐写数据"""
    img = Image.open(image_path)
    
    if img.mode != 'RGB':
        img = img.convert('RGB')
    
    width, height = img.size
    binary_data = ""
    
    # 提取每个像素的最低位
    for y in range(height):
        for x in range(width):
            r, g, b = img.getpixel((x, y))
            
            # 提取RGB三个通道的最低位
            binary_data += str(r & 1)
            binary_data += str(g & 1)
            binary_data += str(b & 1)
    
    # 转换为字节
    with open(output_file, 'wb') as f:
        for i in range(0, len(binary_data), 8):
            byte = binary_data[i:i+8]
            if len(byte) == 8:
                f.write(bytes([int(byte, 2)]))
    
    print(f"提取完成: {output_file}")

def extract_lsb_specific_channel(image_path, channel='R', bits=1):
    """提取特定通道的LSB"""
    img = Image.open(image_path)
    
    if img.mode != 'RGB':
        img = img.convert('RGB')
    
    width, height = img.size
    binary_data = ""
    
    channel_map = {'R': 0, 'G': 1, 'B': 2}
    channel_idx = channel_map.get(channel.upper(), 0)
    
    for y in range(height):
        for x in range(width):
            pixel = img.getpixel((x, y))
            value = pixel[channel_idx]
            
            # 提取最低n位
            for bit in range(bits):
                binary_data += str((value >> bit) & 1)
    
    # 转换为文本
    text = ""
    for i in range(0, len(binary_data), 8):
        byte = binary_data[i:i+8]
        if len(byte) == 8:
            char_code = int(byte, 2)
            if 32 <= char_code <= 126:
                text += chr(char_code)
            else:
                text += '.'
    
    return text

# 使用
extract_lsb('stego.png', 'extracted.bin')
print(extract_lsb_specific_channel('stego.png', 'R', 1))
```

#### 图片XOR操作

**Python实现**:
```python
from PIL import Image
import numpy as np

def xor_images(img1_path, img2_path, output_path):
    """两张图片XOR操作"""
    img1 = Image.open(img1_path).convert('RGB')
    img2 = Image.open(img2_path).convert('RGB')
    
    # 确保尺寸相同
    if img1.size != img2.size:
        img2 = img2.resize(img1.size)
    
    # 转为numpy数组
    arr1 = np.array(img1)
    arr2 = np.array(img2)
    
    # XOR操作
    xor_result = np.bitwise_xor(arr1, arr2)
    
    # 保存结果
    result_img = Image.fromarray(xor_result.astype('uint8'))
    result_img.save(output_path)
    print(f"XOR结果已保存: {output_path}")

def xor_with_key(img_path, key, output_path):
    """图片与单字节密钥XOR"""
    img = Image.open(img_path)
    arr = np.array(img)
    
    # XOR每个像素
    xor_result = np.bitwise_xor(arr, key)
    
    result_img = Image.fromarray(xor_result.astype('uint8'))
    result_img.save(output_path)
    print(f"XOR结果已保存: {output_path}")

# 使用
xor_images('image1.png', 'image2.png', 'xor_result.png')
xor_with_key('image.png', 42, 'xor_key_result.png')
```

#### 图片通道分离

**Python实现**:
```python
from PIL import Image

def split_channels(image_path, output_dir='channels'):
    """分离RGB通道"""
    import os
    os.makedirs(output_dir, exist_ok=True)
    
    img = Image.open(image_path).convert('RGB')
    r, g, b = img.split()
    
    # 保存各通道
    r.save(f'{output_dir}/red.png')
    g.save(f'{output_dir}/green.png')
    b.save(f'{output_dir}/blue.png')
    
    # 创建只显示单通道的彩色图
    red_only = Image.merge('RGB', (r, Image.new('L', img.size, 0), Image.new('L', img.size, 0)))
    green_only = Image.merge('RGB', (Image.new('L', img.size, 0), g, Image.new('L', img.size, 0)))
    blue_only = Image.merge('RGB', (Image.new('L', img.size, 0), Image.new('L', img.size, 0), b))
    
    red_only.save(f'{output_dir}/red_visual.png')
    green_only.save(f'{output_dir}/green_visual.png')
    blue_only.save(f'{output_dir}/blue_visual.png')
    
    print(f"通道已分离到: {output_dir}")

def analyze_channels(image_path):
    """分析各通道统计信息"""
    img = Image.open(image_path).convert('RGB')
    r, g, b = img.split()
    
    import numpy as np
    
    for name, channel in [('Red', r), ('Green', g), ('Blue', b)]:
        arr = np.array(channel)
        print(f"\n{name} Channel:")
        print(f"  Min: {arr.min()}")
        print(f"  Max: {arr.max()}")
        print(f"  Mean: {arr.mean():.2f}")
        print(f"  Std: {arr.std():.2f}")

# 使用
split_channels('image.png')
analyze_channels('image.png')
```

#### 图片拼图解决

**Python实现**:
```python
from PIL import Image
import os

def auto_puzzle_solver(pieces_dir, rows, cols, output_path):
    """简单拼图还原（已知行列数）"""
    pieces = sorted([f for f in os.listdir(pieces_dir) if f.endswith(('.png', '.jpg'))])
    
    if len(pieces) != rows * cols:
        print(f"警告: 碎片数({len(pieces)})与行列数({rows}x{cols})不匹配")
    
    # 获取单个碎片大小
    first_piece = Image.open(os.path.join(pieces_dir, pieces[0]))
    piece_width, piece_height = first_piece.size
    
    # 创建空白画布
    result = Image.new('RGB', (piece_width * cols, piece_height * rows))
    
    # 拼接
    for idx, piece_name in enumerate(pieces):
        piece = Image.open(os.path.join(pieces_dir, piece_name))
        row = idx // cols
        col = idx % cols
        result.paste(piece, (col * piece_width, row * piece_height))
    
    result.save(output_path)
    print(f"拼图完成: {output_path}")

def smart_puzzle_solver(pieces_dir, output_path):
    """智能拼图（边缘匹配）"""
    # 这里是简化版本，实际需要复杂的边缘匹配算法
    pieces = [Image.open(os.path.join(pieces_dir, f)) 
              for f in sorted(os.listdir(pieces_dir)) 
              if f.endswith(('.png', '.jpg'))]
    
    # 假设为2x2拼图的简单实现
    result = Image.new('RGB', (pieces[0].width * 2, pieces[0].height * 2))
    
    positions = [(0, 0), (pieces[0].width, 0), 
                 (0, pieces[0].height), (pieces[0].width, pieces[0].height)]
    
    for piece, pos in zip(pieces, positions):
        result.paste(piece, pos)
    
    result.save(output_path)
    print(f"拼图完成: {output_path}")

# 使用
auto_puzzle_solver('pieces/', 3, 3, 'solved.png')
```

#### 图片高度/宽度修复

**Python实现**:
```python
from PIL import Image
import struct

def fix_png_height(png_path, output_path):
    """修复PNG高度（通过CRC爆破）"""
    with open(png_path, 'rb') as f:
        data = f.read()
    
    # PNG文件头: 8字节
    # IHDR chunk: 25字节（长度4 + 类型4 + 数据13 + CRC4）
    
    if data[:8] != b'\x89PNG\r\n\x1a\n':
        print("不是有效的PNG文件")
        return
    
    # 读取IHDR
    ihdr_start = 8
    ihdr_length = struct.unpack('>I', data[ihdr_start:ihdr_start+4])[0]
    ihdr_type = data[ihdr_start+4:ihdr_start+8]
    
    if ihdr_type != b'IHDR':
        print("IHDR块位置异常")
        return
    
    # 读取宽度
    width = struct.unpack('>I', data[ihdr_start+8:ihdr_start+12])[0]
    # 读取高度（可能被修改）
    height = struct.unpack('>I', data[ihdr_start+12:ihdr_start+16])[0]
    
    print(f"当前尺寸: {width}x{height}")
    
    # 尝试爆破高度（假设高度在合理范围内）
    import zlib
    
    for try_height in range(1, 10000):
        # 构造新的IHDR数据
        ihdr_data = data[ihdr_start+8:ihdr_start+12]  # 宽度
        ihdr_data += struct.pack('>I', try_height)     # 新高度
        ihdr_data += data[ihdr_start+16:ihdr_start+21] # 其他数据
        
        # 计算CRC
        calc_crc = zlib.crc32(b'IHDR' + ihdr_data) & 0xffffffff
        actual_crc = struct.unpack('>I', data[ihdr_start+21:ihdr_start+25])[0]
        
        if calc_crc == actual_crc:
            print(f"找到正确高度: {try_height}")
            
            # 写入修复后的文件
            new_data = data[:ihdr_start+12]
            new_data += struct.pack('>I', try_height)
            new_data += data[ihdr_start+16:]
            
            with open(output_path, 'wb') as f:
                f.write(new_data)
            
            print(f"修复完成: {output_path}")
            return try_height
    
    print("未找到正确高度")
    return None

# 使用
fix_png_height('broken.png', 'fixed.png')
```

#### 二维码生成与识别

**Python实现**:
```python
# 安装: pip install qrcode pyzbar pillow

import qrcode
from pyzbar.pyzbar import decode
from PIL import Image

def generate_qr(data, output_path):
    """生成二维码"""
    qr = qrcode.QRCode(
        version=1,
        error_correction=qrcode.constants.ERROR_CORRECT_L,
        box_size=10,
        border=4,
    )
    qr.add_data(data)
    qr.make(fit=True)
    
    img = qr.make_image(fill_color="black", back_color="white")
    img.save(output_path)
    print(f"二维码已生成: {output_path}")

def decode_qr(image_path):
    """识别二维码"""
    img = Image.open(image_path)
    decoded_objects = decode(img)
    
    if not decoded_objects:
        print("未检测到二维码")
        return None
    
    for obj in decoded_objects:
        print(f"类型: {obj.type}")
        print(f"数据: {obj.data.decode('utf-8')}")
        print(f"位置: {obj.rect}")
        return obj.data.decode('utf-8')

# 使用
generate_qr("flag{hello_world}", "qr.png")
data = decode_qr("qr.png")
```

## CTF解题技巧

!!! tip "图片隐写检测流程"
    ```bash
    1. 文件基本信息
    file image.png
    exiftool image.png
    
    2. 查看十六进制
    xxd image.png | head
    xxd image.png | tail
    
    3. Binwalk检测
    binwalk image.png
    
    4. Strings搜索
    strings image.png | grep -i flag
    
    5. LSB分析
    zsteg image.png (PNG/BMP)
    stegsolve (所有格式)
    
    6. 在线自动化
    https://www.aperisolve.com/
    ```

!!! tip "LSB隐写识别"
    ```
    特征:
    - 文件大小正常
    - 肉眼无异常
    - 最低位被修改
    
    检测:
    - zsteg自动检测
    - StegSolve查看位平面
    - Python脚本提取
    
    可能的变化:
    - 不同通道(R/G/B)
    - 不同位数(1-4位)
    - 不同顺序(横向/纵向)
    ```

!!! tip "图片拼图还原"
    ```python
    # 如果碎片有序号
    按编号顺序拼接
    
    # 如果碎片无序
    1. 边缘检测
    2. 颜色相似度匹配
    3. 使用PuzzleSolver工具
    
    # 常见情况
    - 按行列顺序
    - 蛇形排列
    - 螺旋排列
    ```

!!! tip "PNG高度修复"
    ```python
    # 原理: CRC32校验
    # PNG IHDR包含宽度、高度、CRC
    # 爆破高度使CRC匹配
    
    # 手动修复
    1. 十六进制查看IHDR块
    2. 修改高度字节
    3. 重新计算CRC32
    
    # 自动工具
    Python脚本爆破
    ```

!!! tip "通道分析"
    ```
    异常通道可能藏有信息:
    - Red通道
    - Green通道
    - Blue通道
    - Alpha通道
    
    工具:
    - StegSolve切换通道
    - Python PIL分离通道
    - 查看各通道统计信息
    ```

!!! warning "常见问题"
    ```
    1. LSB提取乱码
       - 尝试不同通道
       - 尝试不同位数
       - 检查提取顺序
    
    2. 图片打不开
       - 检查文件头
       - 修复高度/宽度
       - 检查是否有额外数据
    
    3. 二维码识别失败
       - 调整大小
       - 增强对比度
       - 修复定位点
    
    4. XOR操作无效果
       - 确认两图尺寸一致
       - 尝试不同密钥
       - 查看XOR后的各通道
    ```

## 相关资源

- **Pillow**: Python图像处理库
- **StegSolve**: 图片隐写分析必备
- **Aperi'Solve**: 在线自动化隐写检测
- **QRazyBox**: 二维码修复分析
- **zsteg**: PNG/BMP快速LSB检测
