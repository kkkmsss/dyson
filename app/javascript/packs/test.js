document.addEventListener('DOMContentLoaded', () => {
    let currentIndex = 0;
    const images = document.querySelectorAll('.manual-slide1 img');
  
    setInterval(() => {
      // 現在の画像の透明度を0にする
      images[currentIndex].style.opacity = 0;
  
      // 次の画像に移動する
      currentIndex = (currentIndex + 1) % images.length;
  
      // 新しい画像の透明度を1にする
      images[currentIndex].style.opacity = 1;
    }, 3000);
  });
  