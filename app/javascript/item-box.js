window.addEventListener('load', function(){
  const itemBoxes = document.querySelectorAll(".item-box");
  itemBoxes.forEach(function(itemBox) {
    itemBox.addEventListener('mouseover', function() {
      this.style.boxShadow = "0 10px 25px 0 rgba(0, 0, 0, 0.5)";
    });
    itemBox.addEventListener('mouseout', function() {
      this.style.boxShadow = ""; // 影を削除
    });
  });
});
