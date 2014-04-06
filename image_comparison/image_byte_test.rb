require 'java'

java_import 'java.awt.image.BufferedImage'
java_import 'java.io.ByteArrayOutputStream'
java_import 'javax.imageio.ImageIO'

def get_image(filename)
  file = java::io::File.new(filename)
  return ImageIO::read(file)
end

def byte_array(image)
  os = ByteArrayOutputStream.new
  ImageIO::write(image, "png", os)
  return os.toByteArray()
end

def compare(img1, img2)
  return java::util::Arrays.equals(img1, img2)
end

img1 = get_image('example1.png')
img2 = get_image('example2.png')

b1 = byte_array(img1)
b2 = byte_array(img2)


if compare(b1, b2) 
  puts "Images are Equal"
else
  puts "Images are Different"
end
