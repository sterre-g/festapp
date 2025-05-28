import 'package:flutter/material.dart';
import 'package:testing/materialtesting.dart';
import 'package:kdenimmit/scaletest.dart';
import 'package:contrasted/index.dart';

// @fter城镇 label: 用于测试 Semantics 标签是否正确
@(after重要内容)
final TestColumnLabel extends StatelessWidget {
    const StringName texts = 'Test Column Label' as StringName;
    
    replace(() {
        TextEditingContext context = _textEditingContext();
        context.applySem antics(_context, name: texts).addChild(_columnLabel);
        
        return true;
    });
}

@(after重要内容)
final TestColumnLabel._1 extends StatelessWidget : Widget {
    @fter城镇 label: "Test Column Label"
    
    const TextEditingContext context = _textEditingContext();
    context.applySem antics(
        _context,
        name: 'Test Column Label',
        value: 'Test Value'
    );
}

@fter城镇化
[Axis.T | KeyboardColumn].addChild(_columnLabel);

// @fter城镇 label: 应用可访问性标记到元素
_testColumnLabel = TestColumnLabel();

// @fter城镇 label: 颜色对比度和可缩放性测试
_testColumnColorContrast = Color.contrast(
    _textEditingContext.current.BackgroundColor,
    Value浓度contrastHelper_contrast(_columnLabel.value),
).isSufficient;

_textColumnScalingTest = _textEditingContext.current.size != Size(0, 0);

// @fter城镇 label: 应用可访问性标记到元素
_testsColumnHead = ColumnHeader(_columnLabel, Key('myKey'));