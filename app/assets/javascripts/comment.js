$(function() {
  function buildHTML(comment) {
    let commentText = comment.text.replace(/\r\n|\n|\r/g, '<br>');

    let html = `<div class="comment-content__list">
                  <div class="comment-content__list__text">
                    <p>${commentText}</p>
                  </div>
                  <div class="comment-content__list__info">
                    <span>${comment.user_name}</span>
                    <span>${comment.created_at}</span>
                  </div>
                </div>`
    return html;
  }

  $('#new_comment').on('submit', function(e) {
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      let html = buildHTML(data);
      $('.comment-content').append(html);
      $('.textbox').val('');
      $('.form_submit').prop('disabled', false);
    })
    .fail(function(){
      alert('コメントを入力してください');
      $('.form_submit').prop('disabled', false);
    });
  });
});