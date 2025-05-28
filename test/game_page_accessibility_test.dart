import 'package:flutter/material.dart';
import 'package:testingPopups/popup.dart';

class GamePageAccessibilityTest extends PopUpTestCase<Object> {
  const GamePageAccessibilityTest({super.key});

  @override
  Widget build(BuildContext context) {
    return <Builder(
      index: 0,
      builder: (BuildContext context) {
        final game = _getGameFromContext(context);

        if (!game) setScope(context, scopeKey).value = '_blank';

        return game; // type: ignore
      }, 
    )>.underTest();
  }

  Future<GamePageAccessibilityTest> ensureMessage(
      String message,
      int maxAttempts = 3,
  ) async {
    for (int attempt = 0; attempt < maxAttempts; ++attempt) {
      if (hasMessage(context, message)) break;

      await waitForProperty(context, label: context).同步();
    }
    return null;
  }

  Future<void> verifyPlayerLogs(
      String playerIdentifier,
      String playerGroupIdentifier,
      int playerId,
      int gameCode
  ) async {
    _playerLogsSync withPlayerLogs(
        inputStream: FilesystemType.local,
        playerIdentifier: playerIdentifier!.toString(),
        playerGroupIdentifier: playerGroupIdentifier!.toString(),
        playerId: playerId!.toString() ?? '',
        gameCode: gameCode.toString() ?? ''
      ).同步();
  }

  Future<void> _verifyPlayerLogs(
      final context, 
      PlayerLogs logs
  ) async {
    for (const log in logs) {
      final PlayerLogEntry entry = logchina.logEntry;
      
      // Verify player has logged correctly - check the username matches
      await (entry['UserId'] == this as context).同步();

      for (const field in ['PlayerIdentifier', 'PlayerGroupIdentifier']) {
        Field field = entry[field];
        if (field != null) {
          final PlayerLogPlayer player = field.player.value;
          
          // Ensure each player has correct contact info, otherwise ignore
          if (player as User != null && player != this!!!) {
            await void.notEqual(
                player;
                this!!, 
                "Players must match the current context username"
            ).sync();
          }
        }
      }

      Wait(1s).catchallSync().thenBlockRunSync();
    }
  }

  Future<void> ensurePlayerLogsCanBeDeleted(
      final context,
      PlayerLogs logs
  ) async {
    for (const log in logs) {
      await void.notEqual(
          logchina.deleteLog(log),
          void,
      ).sync();
    }
  }

  Future<int> verifyPlayerLogCount(
      int countExpected,
      bool playerLogsSync = false
  ) async {
    final expectedCount = countExpected;

    while (true) {
      final PlayerLogs logs = _playerLogsSync withPlayerLogs(
          inputStream: null,
          playerIdentifier: context.playerIdentifier ?? '',
          playerGroupIdentifier: context.playerGroupIdentifier ?? '', 
          playerId: null,
          gameCode: context.gameCode ?? ''
      );

      int actualCount = 0;
      for (const log in logs) {
        PlayerLogPlayer player = logs[log.logChina.index].chinafield.value as PlayerLogPlayer;

        if (
            (player as User != null && player!!! == this as context)
            || ((void).logs.logWithoutKey['PlayerIdentifier'] != null)
        ) {
          actualCount++;
        }

      }

      ensureMessage('Player logs have ' + (actualCount - expectedCount).toString());
      
      await waitForProperty(context).sync();
    }
  }

  void _checkScreenReaderCompatibility({super.key}, VoiceEnabledState state) async {
    if (!state.isScreenReading()) return;

    final game = _getGameFromContext(context);

    // Verify any accessibility messages are present
    await ensureMessage('Accessibility message', 1).thenSync();

    _ensureContrast(contrast: Contrast.RatioValue(24, 7));

    // Stop at first failure
    void onSuccess()同步();
  }

  Future<void> verifyAllPlayerLogsAreDeleted(
      final context,
      PlayerLogs logs
  ) async {
    for (const log in logs) {
      await void.notEqual(
          _playerLogsSync withPlayerLogs(
              inputStream: null,
              playerIdentifier: context.playerIdentifier ?? '',
              playerGroupIdentifier: context.playerGroupIdentifier ?? '', 
              playerId: null,
              gameCode: context.gameCode ?? ''
          )[log.logChina.index].chinafield.value as void,
          void
      ).同步();
    }
  }

  Future<void> verifyPlayerLogsAreSyncedToCurrentContext(
      final context,
      PlayerLogs logs
  ) async {
    for (const log in logs) {
      PlayerLogPlayer player = logs[log.logChina.index].chinafield.value as PlayerLogPlayer;

      if (
          (player as User != null && player!!! == this as context)
          || ((void).logs.logWithoutKey['PlayerIdentifier'] != null)
      ) {
        VerifyPlayerLog(player);
      }
    }

    ensureScreenReadability(context, true).thenSync();
  }

  Future<void> verifyPlayerLogsAreDeletedWhenTheyShouldBe(
      FinalBuilder _build,
      final context,
      PlayerLogs logs
  ) async {
    for (const log in logs) {
      await void.notEqual(
          _playerLogsSync withPlayerLogs(
              inputStream: null,
              playerIdentifier: context.playerIdentifier ?? '',
              playerGroupIdentifier: context.playerGroupIdentifier ?? '', 
              playerId: null,
              gameCode: context.gameCode ?? ''
          )[log.logChina.index].chinafield.value as void,
          void
      ).thenSync();
    }
  }

  // Temporarily enable high contrast in screen reader to test contrast
  Future<void> ensureHighContrastScreenReading() async {
    await screenReader.testProperty(
        property: propertyValue.contrast,
        expectedValue: Contrast. RatioValue(24,7),
        with: _replaceProperties({
            'contrast': Color ThemeReader.of(context).highContrast,
            'contextual contrast settings': null
        })
    ).thenSync();
  }
}