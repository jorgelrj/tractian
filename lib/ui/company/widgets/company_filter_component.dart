import 'package:extensions_pack/extensions_pack.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian/domain/domain.dart';
import 'package:tractian/ui/company/company.dart';
import 'package:widgets_pack/widgets_pack.dart';

class CompanyFilterComponent extends StatelessWidget {
  const CompanyFilterComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CompanyCubit>();

    return Padding(
      padding: kXSAll,
      child: Column(
        children: [
          AppTextFormField(
            prefixIcon: const Icon(Icons.search),
            onChanged: cubit.setTitleFilter,
          ),
          const Spacing(),
          Row(
            children: [
              BlocSelector<CompanyCubit, CompanyState, bool>(
                selector: (state) => state.typeFilter == SensorType.energy,
                builder: (context, state) {
                  return FilterChip(
                    label: const Row(
                      children: [
                        Icon(Icons.bolt_outlined),
                        Spacing(),
                        Text('Sensor de Energia'),
                      ],
                    ),
                    selected: state,
                    onSelected: (selected) {
                      cubit.setTypeFilter(
                        selected ? SensorType.energy : null,
                      );
                    },
                  );
                },
              ),
              const Spacing(),
              BlocSelector<CompanyCubit, CompanyState, bool>(
                selector: (state) => state.statusFilter == AssetStatus.alert,
                builder: (context, state) {
                  return FilterChip(
                    label: const Row(
                      children: [
                        Icon(Icons.info_outline),
                        Spacing(),
                        Text('Crítico'),
                      ],
                    ),
                    selected: state,
                    onSelected: (selected) {
                      cubit.setStatusFilter(
                        selected ? AssetStatus.alert : null,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
