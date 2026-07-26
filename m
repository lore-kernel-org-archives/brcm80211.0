Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D6E376BC2
	for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 19:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785093958; cv=none; b=HGzZaJa0h2Gx9fJy/vz2LbmjU3gLrcU83ihnLnFK0FnI+/1utd62bvZ8uiCGMwelOneU0Tf+jdTtbEjpVyA4Sp+F9pgsD2r7g4XDqxax67A/o8u/n/Qzg/9H3zsKWZKnCFlvM/u46zap181aL+ua/cJCWjWsbmTsTf7CTyPjkfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785093958; c=relaxed/simple;
	bh=fYsYE/4pd//5zYUChMxbjn/SjznVltvAOaAi1g7yEcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TZpQzsZrciFm1iWuifVhYft8MDQTgrLEZK+MmZuhZzU19KPSVr80cOZBcDhK78c81jb/IKYnk4sro+YwJKhiSHH1EM1qzSUDoJ0k1/TfbFrvre4EModKgVJb35FAT9Du+LlSsIXfBS1Vcf45Ds4KQWR67FWmQiv8ehM4DrNT4zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=B+1Cnov4; arc=none smtp.client-ip=209.85.214.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="B+1Cnov4"
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2ceaf8a1265so24424085ad.2
        for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 12:25:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785093956; x=1785698756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IdxVhr7EVeFJyQ3maQTqTGgQkmWNCzpHPWLQq6UcYic=;
        b=hG9fIERw+KGV2bhvHDeL8cRZpvd6PAZZuJ2OejAOfBzH1TGGcAaWBFK3xenRYwTvoU
         BB2yCD4JhwbGvAbjOS6OlRvx0bgoGwqcpmxBkuJJf/fFneyukBNEisecMSQtAn+fXXkD
         h2j7qQUIqIokEfhf42N53ULOkikFVUN9wJEsKgTvGNnReOIkPopfeJaZb7gtFZdUb+l3
         xQMipoFQQsKxK+xGIP0eDNQptsc6OUEkaUdw4U2onXSpyR47uPQ3sY4KX2A5WD7ykqgp
         6jEeBl78YhbzpRypDwq06v0x6UcoXqCNrjxfMPcnS7n8s/t7jOVkhpW558u77zp3pF9k
         yNSQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrq5P1Pf+JUA0S+dVCUWSJSraWSTk32Cbdv/LtHJDcp2/uzDicpj5psw6NUo+Z8dHacjinBd9EqkLs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyslJgp6fZYAug0de+x+EKUbOTDSJ6Dg5t4DvRx3WAnm0GTanYr
	sfOFT4bmRBauZ4CICWut1rEoEg2Oklm8WnwbdDqd/4yh8zkQBmwBIvRz/vobA9QUgWNHlf4wQio
	kpbwdi8mVF3v0i0vOouxOv+bfB/2dHFS2YoO1IdkshcKfB4lylDsGoRfJJzg8x/ErjqpP4yeqHs
	3oi0ZL7abYe8N2ATXI25kQMkKe05/kCxv8JMT44Ia990dghMpBQSCU9CbLDXCV0S0zmCQEKzd3W
	9SNSEntMiN58318UDgaOQ==
X-Gm-Gg: AR+sD131HPnTkRI9bHfHluaNgw1lM3k+FH8GmkjDS+/P9uLxk5v8rABqsRmjIUP9SbO
	/R8SikJYybq9JEv4APTOdO7aWLkAuEidOKsCVMs1D2OJNDYwSezPXUUgcm+n9oKnCnKGNU5LYwf
	vY5ehcyPwRzYQtH6NbphEdgcqZF6jBmrDCkptr8mZbQM9EZWrbgnxMC5pCwic3h2tADMEJQ6HS9
	8cu85TE1CK5DDyGtnNk4jrSYMATWxT7d6lMCDul1f8KhF7gWpgZZSV/AdLPKIe8lKpzItblTEWY
	UBaSLt5FjhmlYfyHoa8U9dHr/9LhtmEYPRmODNkwn4OIPMDP+VDShd1Njsdw7hU7C4DeFdtj1yz
	NHnCeu7vhy0UsnUyIxp9jOvX9LW7UFYomgpXo3RG/uGeSos0wnu2XuzyIlOd7U2uhH7ZkFMm/Kc
	s6T9N6hrhbkM8igqRPKoRfNElx7Yp3NKPmA0mPCNo=
X-Received: by 2002:a17:902:f64f:b0:2ca:481:de45 with SMTP id d9443c01a7336-2cfde67bef6mr62287715ad.6.1785093956219;
        Sun, 26 Jul 2026 12:25:56 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2cfde78fe29sm5381825ad.25.2026.07.26.12.25.55
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jul 2026 12:25:56 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc8bde6318so41591965ad.3
        for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 12:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785093954; x=1785698754; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IdxVhr7EVeFJyQ3maQTqTGgQkmWNCzpHPWLQq6UcYic=;
        b=B+1Cnov4e7ZB4UiboYw2a4LGiyh8T28pgevGc/fazZLq+JhBboUVi0snz8ajxEaDwP
         1HR8++9KEb7kBxRhQx1tnsXPNtc/B6rwcV7f+u1XkRMZ0a95sGZOkcWinWtPJ/WQ64zJ
         0aAwdaUedHAIigHDp6DdZ9hUd1bBR1AUe2+l0=
X-Forwarded-Encrypted: i=1; AHgh+Ro3qsD8jJz/v3WbDuUZvCCvijIkDMgxe9QuRAjwaXgkVvv4B2sn0HOwqyLXAkyK9hmTX/p+PWR0kxc=@lists.linux.dev
X-Received: by 2002:a17:902:e544:b0:2cc:f43b:fa4a with SMTP id d9443c01a7336-2cfde8253b7mr58906765ad.24.1785093954314;
        Sun, 26 Jul 2026 12:25:54 -0700 (PDT)
X-Received: by 2002:a17:902:e544:b0:2cc:f43b:fa4a with SMTP id d9443c01a7336-2cfde8253b7mr58906635ad.24.1785093953794;
        Sun, 26 Jul 2026 12:25:53 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm38355795eec.13.2026.07.26.12.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 12:25:53 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next 02/10] wifi: mac80211: stop using ieee80211_mgmt_tx_cookie()
Date: Sun, 26 Jul 2026 21:25:33 +0200
Message-ID: <20260726192541.2816743-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260726192541.2816743-1-arend.vanspriel@broadcom.com>
References: <20260726192541.2816743-1-arend.vanspriel@broadcom.com>
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
index df68a5bdeb2f..3f9954338707 100644
--- a/net/mac80211/cfg.c
+++ b/net/mac80211/cfg.c
@@ -4827,19 +4827,6 @@ int ieee80211_channel_switch(struct wiphy *wiphy, struct net_device *dev,
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
@@ -4864,7 +4851,6 @@ int ieee80211_attach_ack_skb(struct ieee80211_local *local, struct sk_buff *skb,
 	IEEE80211_SKB_CB(skb)->status_data_idr = 1;
 	IEEE80211_SKB_CB(skb)->status_data = id;
 
-	*cookie = ieee80211_mgmt_tx_cookie(local);
 	IEEE80211_SKB_CB(ack_skb)->ack.cookie = *cookie;
 
 	return 0;
diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index 11f449e8ff00..a8ea55265f93 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -1708,8 +1708,6 @@ struct ieee80211_local {
 	struct list_head roc_list;
 	struct wiphy_work hw_roc_start, hw_roc_done;
 	unsigned long hw_roc_start_time;
-	u64 roc_cookie_counter;
-
 	struct idr ack_status_frames;
 	spinlock_t ack_status_lock;
 
@@ -1989,7 +1987,6 @@ u64 ieee80211_reset_erp_info(struct ieee80211_sub_if_data *sdata);
 
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
index eb36f1b9771b..183beae2193a 100644
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

