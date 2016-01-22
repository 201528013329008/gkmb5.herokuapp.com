var editor = new Simditor({


    textarea: $('#editor'),
    toolbar: ['title', 'bold', 'italic', 'underline', 'strikethrough', 'color', '|', 'ol', 'ul', 'blockquote', 'code', 'table','link', '|','hr','indent','outdent','alignment','fullscreen'],
    placeholder: '这里输入文字...',
    pasteImage: true,
    fileKey: 'file',
    upload: {
        url: '/photos',
        params: null,
        connectionCount: 3,
        leaveConfirm: 'Uploading is in progress, are you sure to leave this page?'
    }
});