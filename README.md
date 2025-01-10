Cartoon Figure with Bézier Curves - MATLAB Project


This project recreates the cartoon character Stitch using cubic Bezier curves in MATLAB. It blends computational geometry with creative design, highlighting the power of mathematical modeling in art.

Key Features
•	Cubic Bézier Curves: Used to model Stitch’s contours with smooth, precise shapes.
•	Interactive Control Point Design: Control points were generated using Desmos, enabling real-time adjustments through its drag-and-drop functionality.
•	Advanced Algorithms:
o	de Casteljau Algorithm: Applied for details like Stitch’s nose and mouth, illustrating step-by-step curve construction.
o	F-Mill Algorithm: Ensures G1 continuity, used for features like the leaf detail on Stitch's left leg.
•	Control Polygon Visualization: Overlays Bezier curves with control polygons for a deeper understanding of curve formation.
•	Modularity: Each body part is modeled with separate functions, ensuring flexibility and adaptability.
•	Interactive Modifications: Demonstrates the ability to reshape curves by modifying control points.

How It Works
Control points were determined using Desmos and organized into arrays for MATLAB. Functions like generareCurbaBezier compute the curve coordinates, while modular scripts assemble body parts. The project’s centerpiece, ScriptAsamblareStitchComplet.m, integrates all elements into the final figure.

