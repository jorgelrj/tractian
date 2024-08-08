import 'package:extensions_pack/extensions_pack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian/domain/domain.dart';
import 'package:tractian/ui/home/home.dart';

class HomeCompaniesContent extends StatelessWidget {
  final List<Company> companies;

  const HomeCompaniesContent({
    required this.companies,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return RefreshIndicator(
      onRefresh: cubit.refresh,
      child: ListView.separated(
        itemCount: companies.length,
        separatorBuilder: (context, index) => kSMSpacing,
        itemBuilder: (context, index) {
          final company = companies[index];

          return CompanyCard(
            company,
            key: ValueKey(company),
          );
        },
      ),
    );
  }
}
