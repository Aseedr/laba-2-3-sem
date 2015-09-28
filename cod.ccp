#include <iostream>
#include <string>

using namespace std;

class BookerClass;

class CollaboratorClass {
private:
	static int id;
	int unique_id;
	string full_name;
	int collaborator_salary;
public:
	CollaboratorClass();
	CollaboratorClass(const string &);
	~CollaboratorClass();
	void ShowSalary();
	friend class BookerClass;
	friend void ShowSalaryByFriendFoo(CollaboratorClass &collaborator);
};

int CollaboratorClass::id = 0;

CollaboratorClass::CollaboratorClass(const string &new_name) {
	full_name = new_name;
	unique_id = ++id;
	collaborator_salary = -1;
}

CollaboratorClass::~CollaboratorClass() {
	id--;
	collaborator_salary = -1;
}

class BookerClass {
public:
	void SetCollaboratorSalary(CollaboratorClass &, int);
};

void BookerClass::SetCollaboratorSalary(CollaboratorClass &collaborator, int salary) {
	collaborator.collaborator_salary = salary;
}

void ShowSalaryByFriendFoo(CollaboratorClass &collaborator) {
	cout << "\nFull name of collaborator: " << collaborator.full_name << endl;
	cout << "The unique ID of collaborator: " << collaborator.unique_id << endl;
	cout << "Salary of collaborator: ";
	if (collaborator.collaborator_salary < -1 || collaborator.collaborator_salary > 10000) {
		cout << "Out of salary range (from 0 to 10 000)" << endl;
	} else if (collaborator.collaborator_salary == -1) {
		cout << "Not entered" << endl;
	} else {
		cout << collaborator.collaborator_salary << endl;
	}
}

void CollaboratorClass::ShowSalary() {
	cout << "\nFull name of collaborator: " << full_name << endl;
	cout << "The unique ID of collaborator: " << unique_id << endl;
	cout << "Salary of collaborator: ";
	if (collaborator_salary < -1 || collaborator_salary > 10000) {
		cout << "Out of salary range (from 0 to 10 000)" << endl;
	} else if (collaborator_salary == -1) {
		cout << "Not entered" << endl;
	} else {
		cout << collaborator_salary << endl;
	}
}

int main() {
	CollaboratorClass group[5] = {  "Ivanov Ivan",
					"Maximov Max",
					"Petrov Petr",
					"Semenov Semen",
					"Smirnov Denis"
	};
	BookerClass booker_1;
	for (int i = 0; i < 5; i++) {
		booker_1.SetCollaboratorSalary(group[i], i + 50);
		ShowSalaryByFriendFoo(group[i]);
	}
	CollaboratorClass collaborator_1("Ulianko Victor");
	ShowSalaryByFriendFoo(collaborator_1);
	return 0;
}
