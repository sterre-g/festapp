testWidgets('Responsive Service Accessibility Test', (WidgetTester tester) async {
  final SemanticsHandle handle = tester.ensureSemantics();

  await tester.pumpWidget(ResponsiveService());
  
  // Guideline Checks
  await verifySection("Screen Reader Compatibility");
  await verifySection("Color Contrast Compliance");
  await verifySection("Tap Targets and Keyboard Navigation");

  // Semantic Correctness
  verifySemanticCorrectness(
    context=Context.onboarding手机,
    widget=(value) 
      run {
        expect семantically correct labels for submit buttons in all orientations.
        expect proper hint texts on dropdowns when collapsed.
      } 
  );

  verifySemanticCorrectness(
    context=Context.onboarding平板,
    widget=(value)
      run {
        expect proper labels oriented correctly.
        expect visible text labels are accurate across contexts.
      }
  );

  // Color Contrast
  checkColorContrastOn("phone", "Submit to Dark theme (text and button)"!);
  checkColorContrastOn("tablet", "Submit to Dark theme (text and button)"!);

  // Text Scaling Correctness
  verifyTextScalingSupport(
    context=Context.onboarding mobile (small width),
    widget=(value)
      run {
        after zoom action, check text labels are appropriately scaled down when needed.
      }
  );

  // Keyboard Navigation
  final pipeline = tester.pumpBinding(Pipeline.current!);
  
  expect successful navigation to confirmation screen via tap.
  await pipeValue(pipeline).keyDown.Sequence.isIn("press Tab press Enter")!.verify;

  verifySuccessMessageIsAptlyLabels(
    context=Context.onboarding mobile,
    message="Thank you for your submission. Confirm or don't show again",
    
  );

  // Confirmation Screen on Tap
  await pipeValue(pipeline).keydown("Enter")!; 
  final successScreen = pipeValue(pipeline) as widget?;
  
  if (successScreen != null)
  verify SuccessScreen::message text is rendered correctly.