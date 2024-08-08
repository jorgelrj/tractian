import 'package:auto_route/auto_route.dart';
import 'package:extensions_pack/extensions_pack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian/config/config.dart';
import 'package:tractian/domain/domain.dart';
import 'package:tractian/ui/home/home.dart';
import 'package:widgets_pack/widgets/text.dart';

class CompanyCard extends StatelessWidget {
  final Company company;

  const CompanyCard(
    this.company, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<HomeCubit>();

    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () async {
        final data = await context.router.push<CompanyData>(
          CompanyRoute(
            companyId: company.id,
            company: company,
          ),
        );

        if (data != null) {
          cubit.setCompanyData(
            id: company.id,
            data: data,
          );
        }
      },
      child: Card(
        child: Padding(
          padding: kSMVertical + kLGHorizontal,
          child: Row(
            children: [
              Image.asset(
                AppAssets.gold,
                scale: 1,
              ),
              kXSSpacing,
              Flexible(
                child: TitleMedium(
                  company.name,
                ).color(Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
