package com.nephiwright.components {
    import mx.controls.TextArea;
    import mx.core.IUITextField;
    import mx.core.mx_internal;

    public class TextArea extends mx.controls.TextArea {
        private const _leadingText:String = "&nbsp;&nbsp;&nbsp;&nbsp;&#8226;&nbsp;&nbsp;";
        private var _indentWidth:Number = 0;

        public function TextArea() {
            super();
        }

        override public function set htmlText(value:String):void {
            captureWidth();
            if (value != "") {
                value = applyFix(value);
            }
            super.htmlText = value;
        }

        protected function captureWidth():void {
            var textFieldRef:IUITextField = this.mx_internal::getTextField();
            textFieldRef.htmlText = _leadingText;
            _indentWidth = textFieldRef.textWidth;
            textFieldRef.htmlText = "";
        }

        protected function applyFix(txt:String):String {
            txt = txt.replace(/<\/li><li>/g, "</textformat><br>" + _leadingText + "<textformat blockindent='" + _indentWidth + "'>");
            txt = txt.replace(/<li>/g, "<br>" + _leadingText + "<textformat blockindent='" + _indentWidth + "'>");
            return txt.replace(/<\/li>/g, "</textformat><br>");
        }
    }
}
