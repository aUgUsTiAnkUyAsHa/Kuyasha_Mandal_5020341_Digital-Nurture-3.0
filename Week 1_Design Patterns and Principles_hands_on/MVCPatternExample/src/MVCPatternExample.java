/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package z.mvcpatternexample;

/**
 *
 * @author kuyas
 */
public class MVCPatternExample {

    public static void main(String[] args) {
        Student model = new Student("Raja Das", 123, 85.0);

        StudentView view = new StudentView();

        StudentController controller = new StudentController(model, view);

        controller.setStudentName("Raja Das");
        controller.setStudentGrade(90.0);

        controller.updateView();
    }
}
