class UserModel {
  final String? name;
  final String email;
  final List<IncomeModel> incomes;
  final List<ExpenseModel> expenses;
  final List<InvestmentModel> investments;
  final List<DebtModel> debts;
  final List<GoalModel> goals;
  final List<EmergencyReserveModel> emergencyReserves;
  final List<OpportunityModel> opportunities;

  UserModel({
    this.name,
    required this.email,
    List<IncomeModel>? incomes,
    List<ExpenseModel>? expenses,
    List<InvestmentModel>? investments,
    List<DebtModel>? debts,
    List<GoalModel>? goals,
    List<EmergencyReserveModel>? emergencyReserves,
    List<OpportunityModel>? opportunities,
  })  : incomes = incomes ?? <IncomeModel>[],
        expenses = expenses ?? <ExpenseModel>[],
        investments = investments ?? <InvestmentModel>[],
        debts = debts ?? <DebtModel>[],
        goals = goals ?? <GoalModel>[],
        emergencyReserves = emergencyReserves ?? <EmergencyReserveModel>[],
        opportunities = opportunities ?? <OpportunityModel>[];

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      incomes: List<IncomeModel>.from(json['incomes'].map(
        (dynamic value) => IncomeModel.fromJson(value),
      )),
      expenses: List<ExpenseModel>.from(
        json['expenses'].map((dynamic value) => ExpenseModel.fromJson(value)),
      ),
      investments: List<InvestmentModel>.from(
        json['investments']
            .map((dynamic value) => InvestmentModel.fromJson(value)),
      ),
      debts: List<DebtModel>.from(
        json['debts'].map((dynamic value) => DebtModel.fromJson(value)),
      ),
      goals: List<GoalModel>.from(
        json['goals'].map((dynamic value) => GoalModel.fromJson(value)),
      ),
      emergencyReserves: List<EmergencyReserveModel>.from(
        json['emergencyReserves']
            .map((dynamic value) => EmergencyReserveModel.fromJson(value)),
      ),
      opportunities: List<OpportunityModel>.from(
        json['opportunities']
            .map((dynamic value) => OpportunityModel.fromJson(value)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'incomes': incomes.map((IncomeModel x) => x.toJson()).toList(),
      'expenses': expenses.map((ExpenseModel x) => x.toJson()).toList(),
      'investments':
          investments.map((InvestmentModel x) => x.toJson()).toList(),
      'debts': debts.map((DebtModel x) => x.toJson()).toList(),
      'goals': goals.map((GoalModel x) => x.toJson()).toList(),
      'emergencyReserves': emergencyReserves
          .map((EmergencyReserveModel x) => x.toJson())
          .toList(),
      'opportunities':
          opportunities.map((OpportunityModel x) => x.toJson()).toList(),
    };
  }

  UserModel copyWith({
    String? name,
    String? email,
    List<IncomeModel>? incomes,
    List<ExpenseModel>? expenses,
    List<InvestmentModel>? investments,
    List<DebtModel>? debts,
    List<GoalModel>? goals,
    List<EmergencyReserveModel>? emergencyReserves,
    List<OpportunityModel>? opportunities,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      incomes: incomes ?? this.incomes,
      expenses: expenses ?? this.expenses,
      investments: investments ?? this.investments,
      debts: debts ?? this.debts,
      goals: goals ?? this.goals,
      emergencyReserves: emergencyReserves ?? this.emergencyReserves,
      opportunities: opportunities ?? this.opportunities,
    );
  }
}

class IncomeModel {
  final String name;
  final double value;

  IncomeModel({
    required this.name,
    required this.value,
  });

  factory IncomeModel.fromJson(Map<String, dynamic> json) {
    return IncomeModel(
      name: json['name'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'value': value,
    };
  }
}

class ExpenseModel {
  final String name;
  final double value;

  ExpenseModel({
    required this.name,
    required this.value,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) {
    return ExpenseModel(
      name: json['name'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'value': value,
    };
  }
}

class InvestmentModel {
  final String name;
  final double value;

  InvestmentModel({
    required this.name,
    required this.value,
  });

  factory InvestmentModel.fromJson(Map<String, dynamic> json) {
    return InvestmentModel(
      name: json['name'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'value': value,
    };
  }
}

class DebtModel {
  final String name;
  final double value;

  DebtModel({
    required this.name,
    required this.value,
  });

  factory DebtModel.fromJson(Map<String, dynamic> json) {
    return DebtModel(
      name: json['name'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'value': value,
    };
  }
}

class GoalModel {
  final String name;
  final double value;

  GoalModel({
    required this.name,
    required this.value,
  });

  factory GoalModel.fromJson(Map<String, dynamic> json) {
    return GoalModel(
      name: json['name'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'value': value,
    };
  }
}

class EmergencyReserveModel {
  final String name;
  final double value;

  EmergencyReserveModel({
    required this.name,
    required this.value,
  });

  factory EmergencyReserveModel.fromJson(Map<String, dynamic> json) {
    return EmergencyReserveModel(
      name: json['name'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'value': value,
    };
  }
}

class OpportunityModel {
  final String name;
  final double value;

  OpportunityModel({
    required this.name,
    required this.value,
  });

  factory OpportunityModel.fromJson(Map<String, dynamic> json) {
    return OpportunityModel(
      name: json['name'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'value': value,
    };
  }
}
