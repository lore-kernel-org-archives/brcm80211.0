Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D50C20485B
	for <brcm80211@lists.linux.dev>; Sun, 17 Aug 2025 19:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755457497; cv=none; b=dijncJh+qUuooTTSVtTjZISuUF+hCcjOxHHlmW3QZImk9A3ftRXx3fgeGgzdsZ3BaE9a2lgRAsHnqQ1c4qWbTvZaViUwtEas82R4WyThAa6FteT851iX3w247B8DO8Jy5gRqAbRwz8ORUTCOAeZjJVfl/eF8537kL6xNtjJ1stQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755457497; c=relaxed/simple;
	bh=MxEblRKCkXJ/DgdSCMep5VgKqcORb1UxgFVjKkOzcpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CWhWIfBonYsC0o6fkkO+t6lyXB0eLjRzaJwby/wFapmXwshUhJG52jySb5OKnB3s+7CboS+QezQusWhxcQbEtFJHAW8VBEXA0euUN5KNFNDI6LiRl8YZg4UVb2nftL9whIhbok3y5nlJX/zovCfDSguMQugB5FtNU5KnCdATXyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=HYI3BXmp; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HYI3BXmp"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4b109c63e84so37289261cf.3
        for <brcm80211@lists.linux.dev>; Sun, 17 Aug 2025 12:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1755457495; x=1756062295; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HG3pn2yI0jlbVIy2QdxZ8bTkBToAwMOqbtcIXoALkyU=;
        b=HYI3BXmpw+EriT3PuHrkKp5nlgSIhCoy6nf8aMFUb2yZgnyAxrMAiCqAT0nMsERf50
         hSB6PKxA8Qv0soMoFmmxAzt6dR9/hRPGFkFCwVJxGzDUs3zWwPC8dtvKdgR4gbsAPs3z
         yaWjXQiQ6cLK+vzuTxfdS/TWMjaDf3HG52WM8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755457495; x=1756062295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HG3pn2yI0jlbVIy2QdxZ8bTkBToAwMOqbtcIXoALkyU=;
        b=tsofjKB1xWs3jzeRNOQ0lF14lJeagaTI9101Zqla/AqKJPBNkiX0o+/ZX9uwxv7NJK
         Oqz7VCaGbjMQJyZA1kRFKVjot/RQLfJvM+MQhMNkzJZvHdanv0oK9x2KGqPsJ8gsKiZB
         kYOTtQUd1/hhx/C81MF/dPEj3kYE2r2vLu2Y0APPNDS9T6OUPmE0QokgfHkZyXMgXFc0
         +IYBBpYqHpt8rs6/IeJHPrWCAButGdBdGxTMd2LEgjWcaAkyrc3aqtfZTL7RbrYaUO8j
         y8Q7wjGRXCa796CtDnLfMbyhqWketUV+mDxLgY6wc3V8TqjvEZGO7iLPO0Pe5OjTWI3T
         0mJg==
X-Forwarded-Encrypted: i=1; AJvYcCXv3pqiFbkFNmffvZFjCqhlotDJZn4SHadpBaaknWoLb4NuottPBlH66yTTvJfZGkj0y6J1lg7dOKg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzkEwI9YQM7ANPUQm6udXX00+pGAD1fS8wMxanYFHceK1sQ0bgJ
	S2fqeGBZNr8mltYv+vfukIAXt6EsWEzbD1Ufwv+bPsaS2GTce26QeGxKqjqZ+HCq8JiyYSCO1cl
	N8cAzB65g
X-Gm-Gg: ASbGncug8Ogw5srp96HKf5gfTMNJ/Azb0yRBtm3TGMxMOcnzXaE5pZw/lsvgGDXY29l
	x6Jn8lLy9KTHtRQPtNHYeIvBpjIJNQH8Uqt4oU+WdFYsba+BQrvJioUDiT+8+/H2gYpi6eZOLZ/
	UBqIL/pKlQudiiLkQGwAZkCKbSW7TT/cV+kL0bN8/PC/9/szotJhrREeMLEtmJzCwoidFD4GwMM
	Qlb3sJUvyWA7fRzJ9owJfhy9coFAA95Aga1QErb93fCvL4+y+ce7agEewyZNmnHZ+LFJtg+8wyD
	mM0GLMtJA3TRtJ67cyihqbHQLLWEgGv+RBkWfge3lj+tis2AYACrVx+BFNC6oCC+bMbpyxJ+Qcw
	R59okR+X1H9MsSVWDHDHpNtql44U2vJOWSv7d1ENtJ7fxZkOGj4pt1jhvhW1r4qj3nlD/zj1rhX
	Ml3w==
X-Google-Smtp-Source: AGHT+IH5PD6F5Xet9ktLWPtrRVw+c5s7WwvNKhosT89aMGG9sb1Wggf6mRV66QUd0fWY+ozXhIJPyQ==
X-Received: by 2002:a05:622a:5444:b0:4b0:b7cf:8cde with SMTP id d75a77b69052e-4b129209c6emr60569101cf.21.1755457495036;
        Sun, 17 Aug 2025 12:04:55 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b11de50b31sm40382461cf.51.2025.08.17.12.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 12:04:54 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH wireless-next v2 2/4] wifi: drivers; indicate support for attributes in NL80211_CMD_SET_BSS
Date: Sun, 17 Aug 2025 21:04:33 +0200
Message-ID: <20250817190435.1495094-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250817190435.1495094-1-arend.vanspriel@broadcom.com>
References: <20250817190435.1495094-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The command NL80211_CMD_SET_BSS has a number of individual attributes
and the driver can advertise which of those it will handle when it is
changed by user-space. For drivers providing an empty .change_bss()
the callback has been removed.

Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 drivers/net/wireless/ath/wil6210/cfg80211.c        | 1 +
 drivers/net/wireless/microchip/wilc1000/cfg80211.c | 7 -------
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c  | 8 --------
 net/mac80211/main.c                                | 8 ++++++++
 4 files changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/net/wireless/ath/wil6210/cfg80211.c b/drivers/net/wireless/ath/wil6210/cfg80211.c
index 7703a0933a14..7218fe70f3bc 100644
--- a/drivers/net/wireless/ath/wil6210/cfg80211.c
+++ b/drivers/net/wireless/ath/wil6210/cfg80211.c
@@ -2708,6 +2708,7 @@ static void wil_wiphy_init(struct wiphy *wiphy)
 	wiphy->n_cipher_suites = ARRAY_SIZE(wil_cipher_suites);
 	wiphy->mgmt_stypes = wil_mgmt_stypes;
 	wiphy->features |= NL80211_FEATURE_SK_TX_STATUS;
+	wiphy->bss_param_support = WIPHY_BSS_PARAM_AP_ISOLATE;
 
 	wiphy->n_vendor_commands = ARRAY_SIZE(wil_nl80211_vendor_commands);
 	wiphy->vendor_commands = wil_nl80211_vendor_commands;
diff --git a/drivers/net/wireless/microchip/wilc1000/cfg80211.c b/drivers/net/wireless/microchip/wilc1000/cfg80211.c
index a395829ebadf..c39e7f313ea1 100644
--- a/drivers/net/wireless/microchip/wilc1000/cfg80211.c
+++ b/drivers/net/wireless/microchip/wilc1000/cfg80211.c
@@ -794,12 +794,6 @@ static int get_station(struct wiphy *wiphy, struct net_device *dev,
 	return 0;
 }
 
-static int change_bss(struct wiphy *wiphy, struct net_device *dev,
-		      struct bss_parameters *params)
-{
-	return 0;
-}
-
 static int set_wiphy_params(struct wiphy *wiphy, int radio_idx, u32 changed)
 {
 	int ret = -EINVAL;
@@ -1709,7 +1703,6 @@ static const struct cfg80211_ops wilc_cfg80211_ops = {
 	.change_station = change_station,
 	.get_station = get_station,
 	.dump_station = dump_station,
-	.change_bss = change_bss,
 	.set_wiphy_params = set_wiphy_params,
 
 	.external_auth = external_auth,
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index ac3d085808e9..315bab373729 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -2441,13 +2441,6 @@ static int	cfg80211_rtw_dump_station(struct wiphy *wiphy,
 	return ret;
 }
 
-static int	cfg80211_rtw_change_bss(struct wiphy *wiphy,
-					struct net_device *ndev,
-					struct bss_parameters *params)
-{
-	return 0;
-}
-
 void rtw_cfg80211_rx_action(struct adapter *adapter, u8 *frame, uint frame_len, const char *msg)
 {
 	s32 freq;
@@ -2704,7 +2697,6 @@ static struct cfg80211_ops rtw_cfg80211_ops = {
 	.del_station = cfg80211_rtw_del_station,
 	.change_station = cfg80211_rtw_change_station,
 	.dump_station = cfg80211_rtw_dump_station,
-	.change_bss = cfg80211_rtw_change_bss,
 
 	.mgmt_tx = cfg80211_rtw_mgmt_tx,
 };
diff --git a/net/mac80211/main.c b/net/mac80211/main.c
index 9c8f18b258a6..cfa3cc4dd446 100644
--- a/net/mac80211/main.c
+++ b/net/mac80211/main.c
@@ -862,6 +862,14 @@ struct ieee80211_hw *ieee80211_alloc_hw_nm(size_t priv_data_len,
 	if (emulate_chanctx || ops->remain_on_channel)
 		wiphy->flags |= WIPHY_FLAG_HAS_REMAIN_ON_CHANNEL;
 
+	wiphy->bss_param_support = WIPHY_BSS_PARAM_CTS_PROT |
+				   WIPHY_BSS_PARAM_SHORT_PREAMBLE |
+				   WIPHY_BSS_PARAM_SHORT_SLOT_TIME |
+				   WIPHY_BSS_PARAM_BASIC_RATES |
+				   WIPHY_BSS_PARAM_AP_ISOLATE |
+				   WIPHY_BSS_PARAM_HT_OPMODE |
+				   WIPHY_BSS_PARAM_P2P_CTWINDOW |
+				   WIPHY_BSS_PARAM_P2P_OPPPS;
 	wiphy->features |= NL80211_FEATURE_SK_TX_STATUS |
 			   NL80211_FEATURE_SAE |
 			   NL80211_FEATURE_HT_IBSS |
-- 
2.43.5

