Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01193ECBE3
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 12:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785501326; cv=none; b=AtFGDOkcVgQrsyJewuTI+nP7yXGRWuZlWdjftyntObi8eZvTyrd3brwS5elihTa03voLu5KcUISX4af+X3V9bXPShR4lU62TwSxrMvYiDMJyup+eGAocj7WYzwUgFmcLA+4wGBgtxXwknR+Y0zEUy22njnZmQ8ATr+B02ZSIi8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785501326; c=relaxed/simple;
	bh=gTdggbvaB6x7848EGqj36834vWoqoSIsvC5RhvMirJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TuB4o2xT6TNo6zvCfxN+dmKNFh1HAsy3fAF0vlccJ7cVnkUZewKggpjMv++0c8fK5BobkY+xLDdoOHbZzs9QKIyGYpVC5NfDyEn6DvAd9t3JE79aN/cErmkqL2TtMDAq5d0LHx6CaMqW3Bn4yXpDTJG+/DpC17noB9jdrxPD3JY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=AcOs19Yt; arc=none smtp.client-ip=209.85.214.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="AcOs19Yt"
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2cedda2ce6fso7178045ad.1
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 05:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785501324; x=1786106124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dvzVH9b2ozkOdQzhM+oBzR772b6NvYmkBpZvSNx5YlI=;
        b=b5newTvClpWgJQmOcKKKhQJLLSboWAI+X5lXLnWJx/nf4fcvQVBDqk6BdzRFyhibjf
         u9rEZjgmpGBWtSQaR0tbWf/bgoEGQ7ilSMheSHrlu6+Zu3ddpP8Tc0PYrnBHTfeuEnxT
         WZ7PdeFolUI3tQyXJwW8WKI76K9o1JODmtqo5M5pF7J4W9uoZWfNWjXAL/UZGHwQn33v
         llMy/utsrLVmhRNTmn+Q+4v4Gg7olpAjzVkh3Rlk0tp4BCyKVNUj2pYak/muxYmqYQ6W
         QkAvoTCyc9tI5YnQ2ryTjiKd/HurLgsz4A0paMbb/NHLufa9iVhhuc7x7HjyNV8LIO/Y
         MTwA==
X-Forwarded-Encrypted: i=1; AHgh+RrTCKKLipS2H4r2U6sNlun9pnMtykc7+42og+p38HLrZuc00uvUGnCnT/QdanaxS0E42ZYR6l21RyY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxowi10PlOy9bIjg2sMkrdv8BpiLcAwExEWG1M1uxWbmWPDfeKu
	870FA/CffOGOCbtFxxYRUIwuBmVs7A/Ar8RQbNBMPiLj25yulE6xYQ/TkKnXUH56YLoolVaX63/
	6RhaM1wAhTwsb7v39WBocAJahRxpsFeN1ahRqP+g43ydI9+01+WbboguPjngsZYQMC5qKpe9Pg/
	6GURgcpYKTwmK7KAYh+zMFaGRlln48BPFepXU52BwentkD37CjGYedaagYCY039qTCewf8YzHPP
	m6lWd92dOjPQ0mpBkL4hQ==
X-Gm-Gg: AR+sD12QnnDVmuRY38siQGTn7eFumQcXYrAix1YrcEc16vO1XAEXvgoSowRmr1RIJmz
	U3/yFkz/axLQpTk93Uh+bcCOMm0rUBeYpt/HkJwh5sNLfVnsR3FO8TVtOFFa24ewLviTPVx5pR2
	Ozp22AWUHnXo/FBZpO3sGs5Xzdg+bfc2hg1iDR8ixkIQh6+WCP0hkL5xlpGGnnUvZXmFYAQxpMU
	KAhZwzSu12NvZLKAulSLzC0/EyZhmYFv9EJRdETB9JoQ+hbgyqk+nA2DsWcEtBxvQiGw36zlpcG
	3RJP1gs+oneHhhOjiGrRXj/EpyCPBwz+aYRk4lZX05PXIv6JtdsfVUTXxSw7XMSefj55CBH/MTW
	aPOdkdGzBIpWnV6HzcKs60uByHSPxJqmNmvJjR5uEOYTnMwvlnEi84l4J8rIIb4qWyMm/Db0qP6
	n157G9w9QpuRPaewyLM+8ei4lH6YHfW/Hloblx6Ic=
X-Received: by 2002:a17:902:e888:b0:2ca:9d5a:8b6c with SMTP id d9443c01a7336-2d046d5ce45mr18187975ad.5.1785501323928;
        Fri, 31 Jul 2026 05:35:23 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2d04b1379f3sm954785ad.38.2026.07.31.05.35.23
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 31 Jul 2026 05:35:23 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb92868263so1223772a12.2
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 05:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785501322; x=1786106122; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dvzVH9b2ozkOdQzhM+oBzR772b6NvYmkBpZvSNx5YlI=;
        b=AcOs19Ytz26odLEkcT0gnsxOLYVZFECf8vjgQfF3XsOoVUQHDL0mVmtd3PJKKyFJdo
         vFkV4E0MgVlM0RKWkvUk6JoN4FEjZLa2BV85f6k/X05MC3RkwSR5EaeaeKX/eZ2kWlhj
         crW6CqRIguf29FMUZDZMYHv/etBtkOdhho7io=
X-Forwarded-Encrypted: i=1; AHgh+RojVcKdu0ANGQbfWNYCoQftIUtFlg5Bwu1eT9HzBKhwMblszAtY5FCHDBbeV/sMzaIE3WQAgykq8sE=@lists.linux.dev
X-Received: by 2002:a05:6a21:6cc4:b0:3c8:e397:cf77 with SMTP id adf61e73a8af0-3c91b176954mr1786163637.2.1785501322108;
        Fri, 31 Jul 2026 05:35:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:6cc4:b0:3c8:e397:cf77 with SMTP id adf61e73a8af0-3c91b176954mr1786133637.2.1785501321426;
        Fri, 31 Jul 2026 05:35:21 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9be04sm5187041eec.9.2026.07.31.05.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 05:35:20 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next v3 02/13] wifi: mac80211: stop using ieee80211_mgmt_tx_cookie()
Date: Fri, 31 Jul 2026 14:34:58 +0200
Message-ID: <20260731123509.1975281-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260731123509.1975281-1-arend.vanspriel@broadcom.com>
References: <20260731123509.1975281-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Now that cfg80211 pre-assigns the cookie before calling into mac80211,
stop calling ieee80211_mgmt_tx_cookie() in all affected paths:

- ieee80211_start_roc_work(): for normal ROC use the pre-assigned value
  directly instead of generating a new one.
- ieee80211_attach_ack_skb(): the cookie is already set by the caller;
  remove the ieee80211_mgmt_tx_cookie() call and store it in the ack
  SKB as-is. This covers both mgmt_tx and probe_peer since both call
  ieee80211_attach_ack_skb().
- ieee80211_mgmt_tx(): the dummy 0xffffffff assignment for the
  dont_wait_for_ack case is no longer needed; cfg80211_assign_cookie()
  guarantees a non-zero value which is sufficient for the internal
  ROC vs mgmt-tx distinction.
- ieee80211_store_ack_skb(): same fix for the tx_control_port path.

With no remaining callers, remove ieee80211_mgmt_tx_cookie() and the
roc_cookie_counter field from struct ieee80211_local.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 net/mac80211/cfg.c         | 14 --------------
 net/mac80211/ieee80211_i.h |  3 ---
 net/mac80211/offchannel.c  | 17 ++++-------------
 net/mac80211/tx.c          |  4 +---
 4 files changed, 5 insertions(+), 33 deletions(-)

diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
index 0a9247be26af..b6d02d2b28f5 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -4831,19 +4831,6 @@ int ieee80211_channel_switch(struct wiphy *wiphy, struct net_device *dev,
 	return __ieee80211_channel_switch(wiphy, dev, params);
 }
 
-u64 ieee80211_mgmt_tx_cookie(struct ieee80211_local *local)
-{
-	lockdep_assert_wiphy(local->hw.wiphy);
-
-	local->roc_cookie_counter++;
-
-	/* wow, you wrapped 64 bits ... more likely a bug */
-	if (WARN_ON(local->roc_cookie_counter == 0))
-		local->roc_cookie_counter++;
-
-	return local->roc_cookie_counter;
-}
-
 int ieee80211_attach_ack_skb(struct ieee80211_local *local, struct sk_buff *skb,
 			     u64 *cookie, gfp_t gfp)
 {
@@ -4868,7 +4855,6 @@ int ieee80211_attach_ack_skb(struct ieee80211_local *local, struct sk_buff *skb,
 	IEEE80211_SKB_CB(skb)->status_data_idr = 1;
 	IEEE80211_SKB_CB(skb)->status_data = id;
 
-	*cookie = ieee80211_mgmt_tx_cookie(local);
 	IEEE80211_SKB_CB(ack_skb)->ack.cookie = *cookie;
 
 	return 0;
diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index a1ef88fe846d..3760319ab079 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -1710,8 +1710,6 @@ struct ieee80211_local {
 	struct list_head roc_list;
 	struct wiphy_work hw_roc_start, hw_roc_done;
 	unsigned long hw_roc_start_time;
-	u64 roc_cookie_counter;
-
 	struct idr ack_status_frames;
 	spinlock_t ack_status_lock;
 
@@ -1991,7 +1989,6 @@ u64 ieee80211_reset_erp_info(struct ieee80211_sub_if_data *sdata);
 
 void ieee80211_handle_queued_frames(struct ieee80211_local *local);
 
-u64 ieee80211_mgmt_tx_cookie(struct ieee80211_local *local);
 int ieee80211_attach_ack_skb(struct ieee80211_local *local, struct sk_buff *skb,
 			     u64 *cookie, gfp_t gfp);
 
diff --git a/net/mac80211/offchannel.c b/net/mac80211/offchannel.c
index 2bceb73717c6..94be6497f259 100644
--- a/net/mac80211/offchannel.c
+++ b/net/mac80211/offchannel.c
@@ -602,14 +602,12 @@ static int ieee80211_start_roc_work(struct ieee80211_local *local,
 
 	/*
 	 * cookie is either the roc cookie (for normal roc)
-	 * or the SKB (for mgmt TX)
+	 * or the mgmt_tx cookie; both are pre-assigned by cfg80211
 	 */
-	if (!txskb) {
-		roc->cookie = ieee80211_mgmt_tx_cookie(local);
-		*cookie = roc->cookie;
-	} else {
+	if (!txskb)
+		roc->cookie = *cookie;
+	else
 		roc->mgmt_tx_cookie = *cookie;
-	}
 
 	req = wiphy_dereference(local->hw.wiphy, local->scan_req);
 
@@ -1021,13 +1019,6 @@ int ieee80211_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 			kfree_skb(skb);
 			goto out_unlock;
 		}
-	} else {
-		/* Assign a dummy non-zero cookie, it's not sent to
-		 * userspace in this case but we rely on its value
-		 * internally in the need_offchan case to distinguish
-		 * mgmt-tx from remain-on-channel.
-		 */
-		*cookie = 0xffffffff;
 	}
 
 	if (!need_offchan) {
diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
index 0cf5f6ec75e6..6993e694e835 100644
--- a/net/mac80211/tx.c
+++ b/net/mac80211/tx.c
@@ -2605,10 +2605,8 @@ static u16 ieee80211_store_ack_skb(struct ieee80211_local *local,
 		if (id >= 0) {
 			info_id = id;
 			*info_flags |= IEEE80211_TX_CTL_REQ_TX_STATUS;
-			if (cookie) {
-				*cookie = ieee80211_mgmt_tx_cookie(local);
+			if (cookie)
 				IEEE80211_SKB_CB(ack_skb)->ack.cookie = *cookie;
-			}
 		} else {
 			kfree_skb(ack_skb);
 		}
-- 
2.54.0

