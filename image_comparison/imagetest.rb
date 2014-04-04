require 'java'

java_import 'java.awt.Dimension'
java_import 'java.awt.Rectangle'
java_import 'java.awt.Robot'
java_import 'java.awt.Toolkit'
java_import 'java.awt.event.InputEvent'
java_import 'java.awt.image.BufferedImage'
java_import 'javax.imageio.ImageIO'

def get_image(filename)
    file = java::io::File.new(filename)
      return ImageIO::read(file)
end

def compare_size(img1, img2)
    if (img1.getWidth == img2.getWidth && img1.getHeight == img2.getHeight)
          return true
            else
                  return false
                    end
end

def compare_pixels(img1, img2)
    (0..img1.getWidth-1).each do |x|
          (0..img1.getHeight-1).each do |y|
                  if(img1.getRGB(x, y) != img2.getRGB(x, y))
                              return false
                                    end
                      end
            end
      return true
end

img1 = get_image('example1.png')
img2 = get_image('example2.png')

if (compare_size(img1, img2))
    if (compare_pixels(img1, img2))
          puts "Images are Equal"
            else
                  puts "Images are Different"
                    end
else
    puts "Images are Not Same Size"
end
