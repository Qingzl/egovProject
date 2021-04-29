/*定义1个表单项类
* 属性：标签、id
* */
formItem = function (label,input_id,font_id) {
    this.label = label;
    this.input_id = input_id;
    this.font_id = font_id;
}

formItemByReg = function (input_class,font_class) {
    this.input_class = input_class;
    this.font_class = font_class;
}

checkFormItem = function () {
    this.onAllFormItem = function (formItems) {
        $.each(formItems,function (index,ele) {
            var $inputEle = $("#"+ele.input_id);
            var $fontEle = $("#"+ele.font_id);
            $inputEle.blur(function () {
               if ($inputEle.val().trim() == ""){
                   $fontEle.text(ele.label+"不能为空");
               }

               if($inputEle[0].type == "password"){
                   var inputEle0 = $("#"+formItems[0].input_id);
                   var inputEle1 = $("#"+formItems[1].input_id);
                   var fontEle1 = $("#"+formItems[1].font_id);
                   if (index == 0){
                       if ($inputEle.val().trim() != inputEle1.val().trim()){
                           fontEle1.text("密码不一致");
                       }
                   }else if (index == 1){
                       if ($inputEle.val().trim() != inputEle0.val().trim()){
                           $fontEle.text("密码不一致");
                       }
                   }
               }
            });
            $inputEle.focus(function () {
                if ($fontEle.text().trim().length > 1){
                    $fontEle.text("*");
                }
            });
        })
    }

    this.checkForm = function (formItems) {
        var count = 0;
        $.each(formItems,function (index,ele) {
            var $inputEle = $("#"+ele.input_id);
            var $fontEle = $("#"+ele.font_id);
            $inputEle.focus();
            $inputEle.blur();
            if ($fontEle.text().trim().length == 1){
                count++;
            }
        })
        if (count == formItems.length){
            return true;
        }else {
            return false;
        }
    }

    this.checkFormByReg = function (formItemByRegEle) {
        var reg = /^\+?[1-9][0-9]*$/;
        var fonts = $("."+formItemByRegEle.font_class);
        var inputs = $("."+formItemByRegEle.input_class);
        $.each(inputs,function (i,e) {
            e.onblur=function () {
                if (!reg.test(e.value.trim())){
                    fonts[i].innerText = "无效数据";
                }
                alert(0);
            }

            e.onfocus=function () {
                if (fonts[i].innerText.length > 1){
                    fonts[i].innerText = "*";
                }
            }
        });
    }
}
var cfi = new checkFormItem();

resourceBoundleUtil = function () {
    /*'000 - 中国， 001-美国, 002-英国 , 003-日本'*/
    this.getString = function (ctyCode) {
        var map = new Map();
        map.set("000","中国");
        map.set("001","美国");
        map.set("002","英国");
        map.set("003","日本");

        map.set("cry_000","人民币");
        map.set("cry_001","美元");
        map.set("cry_002","日元");
        map.set("cry_003","欧元");
        return map.get(ctyCode);
    }
}
var rbUtil = new resourceBoundleUtil();