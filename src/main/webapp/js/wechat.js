var imageArray = {
    localId: [],
    field: []
};
function choose_image(img, input, div) {
    //点击对应的图片的父级实施图片的添加
    wx.chooseImage({
        count: 1, // 默认9
        sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
        sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
        success: function (res) {
            var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
            imageArray.localId[imageArray.localId.length] = localIds[0];
            imageArray.field[imageArray.field.length] = input;
            img.attr("src", localIds[0]);
            if(div) {
                div.show();
            }
        }
    });
}
function choose_child_image(parent, input) {
    //点击对应的图片的父级实施图片的添加
    wx.chooseImage({
        count: 1, // 默认9
        sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
        sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
        success: function (res) {
            var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
            imageArray.localId[imageArray.localId.length] = localIds[0];
            imageArray.field[imageArray.field.length] = input;
            $(parent).find("img").attr("src", localIds[0]);
        }
    });
}
function upload_image(upload_success) {
    if (imageArray.localId.length == 0) {
        upload_success();
        return;
    }
    var i = 0, length = imageArray.localId.length;

    function upload() {
        wx.uploadImage({
            localId: imageArray.localId[i],
            success: function (res) {
                var input = imageArray.field[i];
                input.val(res.serverId);
                i++;
                if (i < length) {
                    upload();
                } else {
                    imageArray.localId.length = 0;
                    imageArray.field.length = 0;
                    upload_success();
                }
            },
            fail: function (res) {
                imageArray.localId.length = 0;
                imageArray.field.length = 0;
                alert(JSON.stringify(res));
            }
        });
    }
    upload();
}
function choose_upload_image(img, input) {
    //点击对应的图片的父级实施图片的添加
    wx.chooseImage({
        count: 1, // 默认9
        sizeType: ['original', 'compressed'], // 可以指定是原图还是压缩图，默认二者都有
        sourceType: ['album', 'camera'], // 可以指定来源是相册还是相机，默认二者都有
        success: function (res) {
            var localIds = res.localIds; // 返回选定照片的本地ID列表，localId可以作为img标签的src属性显示图片
            imageArray.localId[imageArray.localId.length] = localIds[0];
            imageArray.field[imageArray.field.length] = input;
            img.attr("src", localIds[0]);
            upload_image(upload_success);
        }
    });
}
