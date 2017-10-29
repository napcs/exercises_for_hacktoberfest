import java.util.Scanner;;

public class Temp{
	public static void main(String[] args){
		Scanner scanner = new Scanner(System.in);

		System.out.println("Press C to convert from Fahrenheit to Celsius." + "\n" + "Press F to convert from Celsius to Fahrenheit.");
		System.out.println("Your choice: ");
		String choice = scanner.next();
		
		if(choice.equals("C") || choice.equals("c")){
			System.out.print("Please enter the temperature in Fahrenheit: ");
			Double f = Double.parseDouble(scanner.next());

			Double c = (f-32) * (5/9);
			System.out.print("The tempurature in Celsius is "+c);
		} else if (choice.equals("F") || choice.equals("f")){
			System.out.print("Please enter the temperature in Celsius: ");
                        Double c = Double.parseDouble(scanner.next());

                        Double f = (c *(9/5)) + 32;
			System.out.print("The tempurature in Fehrenheit is "+f);
		} else {
			System.out.println("Sorry, I don't understand.");
		}
	}
}
