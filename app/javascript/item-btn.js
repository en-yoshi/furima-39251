window.addEventListener('load', function(){
  const itemBtns = document.querySelectorAll(".item-btn");
  itemBtns.forEach(function(itemBtn) {
    itemBtn.addEventListener('mouseover', function() {
      this.style.boxShadow = "0 10px 25px 0 rgba(0, 0, 0, 0.5)";
    });
    itemBtn.addEventListener('mouseout', function() {
      this.style.boxShadow = ""; // 影を削除
    });
  });
});
