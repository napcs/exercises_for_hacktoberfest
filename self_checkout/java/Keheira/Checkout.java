import java.util.Scanner;

public class Checkout{
	public static void main(String[] args){
		Scanner scanner = new Scanner(System.in);

		//Input
		System.out.print("Enter the price of item 1: ");
		Double price1 = Double.parseDouble(scanner.next());
		System.out.print("enter the quantity of item 1: ");
		int qual1 = Integer.parseInt(scanner.next());
		System.out.print("Enter the price of item 2: ");
                Double price2 = Double.parseDouble(scanner.next());
                System.out.print("enter the quantity of item 2: ");
                int qual2 = Integer.parseInt(scanner.next());
		System.out.print("Enter the price of item 3: ");
                Double price3 = Double.parseDouble(scanner.next());
                System.out.print("enter the quantity of item 3: ");
                int qual3 = Integer.parseInt(scanner.next());

		//Processing
		Double subtotal = (price1 * qual1) + (price2 * qual2) + (price3 * qual3);
		Double tax = .055 * subtotal;
		Double total = subtotal + tax;

		//Output
		System.out.println("Subtotal: $" + subtotal);
		System.out.println("Tax: $" + tax);
		System.out.println("Total: $" + total);
	}
}
