Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A17921B9F2
	for <brcm80211@lists.linux.dev>; Thu, 19 Jun 2025 08:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750321579; cv=none; b=EL5UU5A1Y7Xp+InpLEyY0tChaaTtAl4Eae8COTfjh/3Spf790FbFMu6F+rSkaOGYZHYVytMR1/XySyJvpFJDPosy/T/NEUTP9NHXQrcgXs8SQiIOeirCoWKDpaAukGYAkEm59wv2EYzwHk9yBZUyGYNR+L5PMmIq5wdGpib/NOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750321579; c=relaxed/simple;
	bh=joblJuM3YJrC3NH4fp8pNVtiViql4YenRSFoWywNdnM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=P50Im6UoNnZH0K+Ja8NU95IfocUOhQ+/eEkFK65Y1Uyu+ZIUNyHa62R/7s2WVJ6uTZR4UtTRiBZuVL6ZZ+JMDz/1MLrTJIXlJbP2XE+jVJXukB47YttDODvjCJ9Te1r8W9Xx8/kh9H/V5pWB290g9cuzMmcbrwnj32scIX3Vs2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1iFH8Wb; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1iFH8Wb"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso215855f8f.3
        for <brcm80211@lists.linux.dev>; Thu, 19 Jun 2025 01:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750321574; x=1750926374; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B0QAsYOvosi5fcQ7ZHm7kVrA3Pm0vHCmDptHz6MIxTc=;
        b=C1iFH8WbVsrI6d8na+0/4CLDgwNP7Sc86Moif7DSbqhO0dtxVVyAY0dqVP4yqjwcXJ
         Egv2/JIgPiI2OE0TjnhYAFDkY2tq7dh4GSO9pvIhYPmi8D5G+ZeZueWg3ADWWLXB3EE0
         0QKSCCvEHJbT1LboTKApWZjpgVEtejmouLuOVjg6wjG5dWW/qbjq2PwIjDzhFPs73L4E
         h9O2316UKMC/wUEL6nzUm8C9qw8ZSnDJWbGCf9YHlM9Y+0tjQd8L+nKqbfaJvv2h2W2J
         d96mDGsAw0E3BUC9Dixqho7IB5vLwWgFy3Oicdpz7YJ6I8g8oCLmzioA7vBtzSGjDSL+
         C/oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750321574; x=1750926374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B0QAsYOvosi5fcQ7ZHm7kVrA3Pm0vHCmDptHz6MIxTc=;
        b=qQD+4TeLSxyU8kz47AOTpK8KYu/vXp9A5CbTQiuJq4ke0KGf6BYu53QqXrliBzgTFe
         M68wEcZh2lfgFDZWZu72E8DVMvzztSX7XWJA43ODvr2ikZWYq8Y+bxuUSci80juqTqjk
         TC2tuLD682ZJwZfK3LIdNkgbQ4hlwMN1qeKN4LA9YLaaJSu48kRpVShNLlUH+VgB2YM5
         4V3TyPIuIY21Mm4q9IZEHakhn6rgNNuBkeq3w13cX4T4mLg7VSP57R3LrzOoPeLOrjqJ
         88doXQmeSt/L0AdcEdBMkA+FvirL98YqOSix57Ru8PEqxtI+v8eUWAjwgOHVJg734z68
         hGKA==
X-Forwarded-Encrypted: i=1; AJvYcCW/AJCpm4VI+sYrDpCuf1FZ/xQGZ5X2nxT262HOzWnuzQiAQR/ipa2h+9BK5is4O/7dOscqiyrPXUc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwdMXep4lsT9pl//ghvqPu4ADCWr2gengYRURhE57hIZ3fz02a6
	FtvUFKaJoYFx1hiHfGO8w5jD1BPkVPs2N3zTuO1op8tg9d4k2TUvWyCyGR+ohSkm0QO1xA==
X-Gm-Gg: ASbGncvrsHGjSmLPg5UOjoqQMPCa3ZByQw8wW/cuy1wrzsr7n6sAl6zXdvGDvfi5gwA
	+rg95eTc0slGoBcCqJiv2fvkuz+Rekc3SSwpM2zPSDCQ1E8D7ILmi80ZOo5S/Y9K8/APYw1ovoH
	B5zFzexMYUZOzjksl2unLfM1Rh0HoNwrCNaqejzhBZgl4JjHuf/+pH1JebQwA9Q5kXTBmBmSdmr
	hU2g5yR1E+pnVrMS2T+91PtieAyxmHB0cKLM4xhZyMgYwTwZHCqo5o+N++TkfBiBmvHZNKBwHsl
	IrFfNMzSDuvlXWn8y7ELfgSpz16oRUea5h3wUNeyuQSBm5xEwER48MWT8AmO
X-Google-Smtp-Source: AGHT+IGWTFmrBJA8zRQdgBQJ3AummUbiD7FB3vTuifAlQScjEa7PD5GnrcF+/Dd8m8wX0HdejVRe9A==
X-Received: by 2002:a05:6000:4027:b0:3a4:fb33:85ce with SMTP id ffacd0b85a97d-3a572e8cd99mr17166579f8f.46.1750321574491;
        Thu, 19 Jun 2025 01:26:14 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453607d8971sm8605895e9.23.2025.06.19.01.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:26:14 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] wifi: brcmfmac: Make read-only array cfg_offset static const
Date: Thu, 19 Jun 2025 09:25:54 +0100
Message-ID: <20250619082554.1834654-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Don't populate the read-only array cfg_offset on the stack at run time,
instead make it static const.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 .../broadcom/brcm80211/brcmfmac/pcie.c        | 24 ++++++++++---------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
index 8f97562811d7..9747928a3650 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
@@ -654,17 +654,19 @@ brcmf_pcie_select_core(struct brcmf_pciedev_info *devinfo, u16 coreid)
 static void brcmf_pcie_reset_device(struct brcmf_pciedev_info *devinfo)
 {
 	struct brcmf_core *core;
-	u16 cfg_offset[] = { BRCMF_PCIE_CFGREG_STATUS_CMD,
-			     BRCMF_PCIE_CFGREG_PM_CSR,
-			     BRCMF_PCIE_CFGREG_MSI_CAP,
-			     BRCMF_PCIE_CFGREG_MSI_ADDR_L,
-			     BRCMF_PCIE_CFGREG_MSI_ADDR_H,
-			     BRCMF_PCIE_CFGREG_MSI_DATA,
-			     BRCMF_PCIE_CFGREG_LINK_STATUS_CTRL2,
-			     BRCMF_PCIE_CFGREG_RBAR_CTRL,
-			     BRCMF_PCIE_CFGREG_PML1_SUB_CTRL1,
-			     BRCMF_PCIE_CFGREG_REG_BAR2_CONFIG,
-			     BRCMF_PCIE_CFGREG_REG_BAR3_CONFIG };
+	static const u16 cfg_offset[] = {
+		BRCMF_PCIE_CFGREG_STATUS_CMD,
+		BRCMF_PCIE_CFGREG_PM_CSR,
+		BRCMF_PCIE_CFGREG_MSI_CAP,
+		BRCMF_PCIE_CFGREG_MSI_ADDR_L,
+		BRCMF_PCIE_CFGREG_MSI_ADDR_H,
+		BRCMF_PCIE_CFGREG_MSI_DATA,
+		BRCMF_PCIE_CFGREG_LINK_STATUS_CTRL2,
+		BRCMF_PCIE_CFGREG_RBAR_CTRL,
+		BRCMF_PCIE_CFGREG_PML1_SUB_CTRL1,
+		BRCMF_PCIE_CFGREG_REG_BAR2_CONFIG,
+		BRCMF_PCIE_CFGREG_REG_BAR3_CONFIG
+	};
 	u32 i;
 	u32 val;
 	u32 lsc;
-- 
2.49.0

