import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian/config/config.dart';
import 'package:tractian/domain/domain.dart';

import 'company.dart';

@RoutePage()
class CompanyScreen extends StatelessWidget {
  final String companyId;
  final Company? company;

  const CompanyScreen({
    @PathParam('id') required this.companyId,
    this.company,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<CompanyCubit>()..loadData(companyId, company: company),
      child: Builder(
        builder: (context) {
          final cubit = context.read<CompanyCubit>();

          return Scaffold(
            appBar: AppBar(
              title: Text(company?.name ?? 'Assets'),
              leading: BackButton(
                onPressed: () {
                  context.router.maybePop(
                    (
                      locations: cubit.state.locations,
                      assets: cubit.state.rootAssets,
                    ),
                  );
                },
              ),
            ),
            body: SafeArea(
              child: BlocSelector<CompanyCubit, CompanyState, bool>(
                selector: (state) => state.loading,
                builder: (context, loading) {
                  return Column(
                    children: [
                      const CompanyFilterComponent(),
                      const Divider(height: 0),
                      Expanded(
                        child: loading
                            ? const CompanyLoadingContent()
                            : BlocSelector<CompanyCubit, CompanyState, List<TreeData>>(
                                selector: (state) => state.data,
                                builder: (context, data) {
                                  return CompanyDataContent(
                                    key: ValueKey(data.length),
                                    data: data,
                                  );
                                },
                              ),
                      ),
                    ],
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
