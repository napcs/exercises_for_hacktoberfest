import java.util.Scanner;

public class Madlib{
	public static void main(String[] args){
		Scanner scanner = new Scanner(System.in);
		
		System.out.print("Enter a noun: ");
		String noun = scanner.next();
		
		System.out.print("Enter a verb: ");
		String verb = scanner.next();

		System.out.print("Enter an adjective: ");
		String adj = scanner.next();

		System.out.print("Enter an adverb: ");
		String adverb = scanner.next();

		System.out.println(String.format("Do you %s your %s %s %s?", verb, adj, noun, adverb)); 
	}
}
