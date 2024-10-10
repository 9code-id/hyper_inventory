/*
//#TEMPLATE account_journal_create
await AccountJournalService().create(
  accountCategoryId: await r.randomId('account_category'),
amount: r.randomDouble(),
description: r.randomDescription(),
userProfileId: currentUser!.id,
);
//#END

//#TEMPLATE account_journal_update
await AccountJournalService().update(
  id: id,
  accountCategoryId: await r.randomId('account_category'),
amount: r.randomDouble(),
description: r.randomDescription(),
userProfileId: currentUser!.id,
);
//#END

//#TEMPLATE account_journal_delete
await AccountJournalService().update(id);
//#END

//#TEMPLATE account_journal_snapshot
AccountJournalService().snapshot();
//#END

//#TEMPLATE account_journal_get_all
AccountJournalService().getAll();
//#END

//#TEMPLATE account_journal_stream_list
StreamList(
  key: Key("account_journal_list"),
  stream: AccountJournalService().snapshot(),
  padding: EdgeInsets.all(12.0),
  headers: [],
  itemBuilder: (itemMap, index) {
    AccountJournal item = AccountJournal.fromJson(itemMap);
    return Text("ID: ${item.id}");
  },
)
//#END
*/
