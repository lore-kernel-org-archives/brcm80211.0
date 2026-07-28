Received: from mail-oa1-f100.google.com (mail-oa1-f100.google.com [209.85.160.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62DCB2C15A0
	for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 14:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249964; cv=none; b=FkzTJ9JSmtiWTFXBevg/UyjdXLZzq4YLDg8X6Mylxe5qyzcGk9THM49e6YhBBC3CdhOnCEocMKE59pmzYt2fvdD7pARzAVGaj7mKN9b2eB9TOTOge1krIFHHDs0bCuddjDWTDWRF+i+DTdCBCoL7sKFDB9Gk4Lle5Opc6oEIyJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249964; c=relaxed/simple;
	bh=fYsYE/4pd//5zYUChMxbjn/SjznVltvAOaAi1g7yEcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WarVZZ/biTJJ2WB1chmggl6XGwZdjfqj1+XN9+Hg0E/bJOKfnkjI1dWVLbzP7ThQqMY4ApJFCuA/Xch2WIa8H+YMLBX5XhL9PEq7wfbqvSt58Il3ErXryDwpnKpb3F5xMsDqnAAPMgzgOF77MSokdFcQXjN2JR+gEWpXt5bR06g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=OC3e6k1K; arc=none smtp.client-ip=209.85.160.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="OC3e6k1K"
Received: by mail-oa1-f100.google.com with SMTP id 586e51a60fabf-456395f4e7bso2442104fac.0
        for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 07:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785249962; x=1785854762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IdxVhr7EVeFJyQ3maQTqTGgQkmWNCzpHPWLQq6UcYic=;
        b=SNIxi167cR8xKcJO6z/knQexBYKiAd5dnthvx4vJF6IC0SrD7w+3JsAqj+W/+xiquy
         nJsMmFppv6TZXopeox7awdLws0j0wSP355J0vUkDP7ZzHFH/TYNsSc5ItsbAIEWj5SdM
         hKQ3JZMNkdTmhv3iAvGVScP8f8mHxX9fFllHliSyfv36hK30DDj7YgjUiX9jlgDjqM5j
         KlC7B+qvrs0iMqoXttvBihD9ZCmJlsFcyLpwPt3qScp67ibHwhVtcbm53ifecckFk/Vq
         6Fp/xecZ9dVdpfVoR6NZQkew7ZUh0/BJsaaWpds2U8rJBcUyYAqRnAI7UKDrtdJOI6kZ
         /J9Q==
X-Forwarded-Encrypted: i=1; AHgh+RrBCJI914GNvLXAOL5PEWkol7kCpG3Doyw2SMxgd2MwoXeNtsRrtaiaPVojMrjVK6ghePID9coKRUo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7Wr8EI5VS/b8n4YZHzcEwIqRLuYSISJR6wSbjxWpNTbDbCa53
	h8X7f+ArgWmYDFgMuanTick8X/NTH2l2PvQ1wJvT8WU3zCGSs7qRMFUuv7+lQ2IaDG2eCGd7wJr
	gLnuLH/UnzLhFHyL7zHbwu5IcOLSVkOk3WSlp7BjE2umlNMxquhucO2xQ65DY/RelfGJERfeqZL
	4NI6RR/2UZM7diGL2V7dOe5sQTklLAEE8HkdGpKq88HHb37L1GqDGu1kQ6/OJSxAFB/qS5gmlcj
	PtWyo6uyklzt0kDlmQdLQ==
X-Gm-Gg: AR+sD11Q0Pbcc+8q/cVrUo2CxfKgF/dqSH+9CqFqfHOuHLWO3z8lxHmJbiPYeCrc95U
	U1s2rB2GJfHDIKsSJf2+ngsN/bjZIslWCTOQCC9h2TZRGvzgGZykSEeV+i8wTYAvXhwTQ0R1WbR
	wKKH/z8wG20+81Nu6vmRToxivrDEtsljBzTfNdyd2LrHPFI1vkFI+zRZOG7x34BvII5poUmoC+2
	4n4IIdrVX5OZXZiUu1/hkxnMeXaDJ6YspasbCBhWZ0AMfbF9q1ipyOPeyQjf1pdH1gUqeNDPWVn
	OJMLg3jDth33DZKKtnKjrXcSs3n34RpB1Uv6ZK9BC9tpcBQFgXzg+k006tc7hB4HY4BsPjSgvXC
	jjFQqQB31foScBub6OpAcUDRhqOz08qjcs4n9bDfqjCYl2vgf8aHV/UOMe0cErkdj6PpEnP9QAR
	zl8g1bqdJAZtzcLqsKBcawmcTMQQ1jts+MGVxp+s4=
X-Received: by 2002:a05:6870:3287:b0:448:84c5:ba5a with SMTP id 586e51a60fabf-4586c9ea32dmr1610059fac.24.1785249961939;
        Tue, 28 Jul 2026 07:46:01 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-45886538137sm6487fac.8.2026.07.28.07.46.01
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2026 07:46:01 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e62e3459fso424664685a.0
        for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 07:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785249960; x=1785854760; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IdxVhr7EVeFJyQ3maQTqTGgQkmWNCzpHPWLQq6UcYic=;
        b=OC3e6k1KP/PTswJ+4LfT571M/akM9szhGeCXRIOGBYMIlf3npiMnA3x5ZHjVnCIBUg
         ZqcYrVih0381NN0PARzjPattyKmA5dQdRYMg9/a6FXTjqi2tpKkjG9T7a3SxMpCKQc0X
         JluzfSQEY4zl+w/r8LB9gWiT2fH6TfZ8c2dAY=
X-Forwarded-Encrypted: i=1; AHgh+RrbNQRP5/HqrOQ/YCA9GLb4ydnHCGQ4EipniBd0O9Y+xCpORJ03017DTMGd9yRUSXRrzOothBjHYME=@lists.linux.dev
X-Received: by 2002:a05:620a:25d2:b0:92e:fd2c:6a1b with SMTP id af79cd13be357-93302772db3mr266144785a.50.1785249960248;
        Tue, 28 Jul 2026 07:46:00 -0700 (PDT)
X-Received: by 2002:a05:620a:25d2:b0:92e:fd2c:6a1b with SMTP id af79cd13be357-93302772db3mr266138085a.50.1785249959637;
        Tue, 28 Jul 2026 07:45:59 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de519154sm878659685a.5.2026.07.28.07.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:45:58 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next v2 02/12] wifi: mac80211: stop using ieee80211_mgmt_tx_cookie()
Date: Tue, 28 Jul 2026 16:45:39 +0200
Message-ID: <20260728144549.2207061-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260728144549.2207061-1-arend.vanspriel@broadcom.com>
References: <20260728144549.2207061-1-arend.vanspriel@broadcom.com>
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

