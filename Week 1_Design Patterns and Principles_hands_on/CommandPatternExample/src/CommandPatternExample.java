/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 */

package z.commandpatternexample;

/**
 *
 * @author kuyas
 */
public class CommandPatternExample {

    public static void main(String[] args) {
        Light light = new Light();
        RemoteControl remoteControl = new RemoteControl();

        Command lightOnCommand = new LightOnCommand(light);
        remoteControl.setCommand(lightOnCommand);
        remoteControl.pressButton();

      
        Command lightOffCommand = new LightOffCommand(light);
        remoteControl.setCommand(lightOffCommand);
        remoteControl.pressButton();
    }
}
