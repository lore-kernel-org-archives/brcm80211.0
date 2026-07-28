Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCA9200110
	for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 14:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249962; cv=none; b=pW9/BcXQwuU4tA76w9+Ju1MakyKAH+Zm3yZGr3mO31dO8Nmvb7I1rk7mwlzAVYVjK7QfG22lZrJpNdbG2qMTCyoq81YNyeltIYE96Bb894CX9hn8jUKJq7Em2/D6xAkRKXio1M46pCwAbo7kguKkXfj3o1qHivRoEXr3R3zB/EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249962; c=relaxed/simple;
	bh=BD6HkR8+ixjVZGr4BNZE3aZpvN45d8J2CJ00o01dUFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tci8Kazy3UWB8skS0erqGDZC868NFil8TvGKijhCrhvoQaxvHDb4fUv8NiRXINgtLVzO6jB5/wqA66ju/n0m/aNVanhaHKCt1F4EOEVsIu0BK4BNvzWhpauVJdS2rRRA+jAF8Zy3POQwfrgO1TZ8qGurzL5Joj2K3Hhz2Gc/nKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ZhmTAxgT; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ZhmTAxgT"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so57802235ad.0
        for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 07:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785249960; x=1785854760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Z+rUEPK43VSdW2Nuxb3Yc2SpJSACoEL0UZ3g3JUyDo=;
        b=A+VbrSxUqSGwnsffuDKQySTcgEDZsRBNU0ks6LiTpB7JQm0FS+swfkBrbvAiVRTXY4
         Q74rsCpPcv4wIDqJ4dGpP6OloUqV42+NYCzTzTblz08dErBWszN5OR4kcjbXa97zMML7
         fjvsQfR0b/hMo7z3R9+9KVZtrkBtiHQHIhl3m/YHY5Mq6uI98/owOxK2DouvcT7hn06S
         /vKK7HeWK5ln2GMQFzUSAdPtWscVB7yR4TkDTg0Z77+B0ihrVepVHh0enOqgWWTgTDUF
         oFSZh49+gLVvrDE/BYg84UHwg8LxIaQFkVNU6D9Qq59lrAAquLj65qjvMNSrMIV1S9xE
         eD2A==
X-Forwarded-Encrypted: i=1; AHgh+RqAQB+7whkyVvkitI8owCL7u9rpB3onBqZbs8rnlyGh9W1uzYvHT3QBJznZ1VqDeLJJZw/boghp0GA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/X4LkhTQBL9jq2UwAxGv4Hu1g1tLMOF0ZftEUuJWXu/NQiEz1
	t6gaC1/lOd0G+E0uYtlGfQNa1jA5pZLjAd3YapxjbAcQbeYd718EOzim8SBa5N9uLpiE8gHa5Nd
	Z9g2q3xTRuDintue0gDEmBggPICvl7amyrDGMbAo7ZZXlh11mtAJvo8oXxs4jmUiTcqHoIxsd7Z
	5jvm2268DRLITCuhguaLomymZNdw6yTtYBUozUi04NXrt1p17sPPiiYFeSXL4UJ78m5Mf6M27f1
	zkgQXBj1UWdhLYk44gfNw==
X-Gm-Gg: AR+sD13SzTly8ej511DuPBxCQJAK4hq2KK//9XChSYwlweLovUMBy4dWPnGwrqbY7QV
	ryTm0wUvpk1tFfhrtcMrWLQINtVa0nT3cckQ22AxMikj1aY8p4zfmrQUWhRwXH9B+e+WZNeOc8q
	a39CTRuolphkqPuafts8rj99dvuIt9xoHK8FGp9PnA7OFF/EvPGqYRDuczZU1bn6DgUZ3IDxUfx
	TfAzaiK50JjNm+YSdEye/DY2IX0y10ZPCFKmQvmvkBWMpVu340NHFCXbGZ5Kt7P3Yu6zhkOY+MF
	3I6ZN/0a2EK4PWMlpSHO3L/qzQ650uGNt8MFBuv0u/QK/l0DsO8qfHXtwIdpYZst6g5xGc9my0x
	JMYmD1OVUj3WpWux3GTzo5bsj2ERJUa6XblIGMjP6bELj+vwKp9AKYibnMcFzqLBqjyWsgHJw55
	9wAYwByI65zfF2NUXGu+98rJwxI0ieLxtgCLFZubY=
X-Received: by 2002:a17:902:d60f:b0:2cc:4c29:8221 with SMTP id d9443c01a7336-2d01605f9a5mr32686835ad.45.1785249959799;
        Tue, 28 Jul 2026 07:45:59 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2cfde58bd93sm10930895ad.1.2026.07.28.07.45.59
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2026 07:45:59 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93106d8affcso336474985a.0
        for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 07:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785249958; x=1785854758; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Z+rUEPK43VSdW2Nuxb3Yc2SpJSACoEL0UZ3g3JUyDo=;
        b=ZhmTAxgTceIqL4tmyru3eA7//RjVxz4X+VweIWXWrn6RTq8ArrHUNapAzYEZnMVrO4
         0Hhj8JDtYOBxMQhrit4Ofxr2luoeRv8hZVWmHSXnO1SVXLj/wgaEonhS1vz2nOMw06ls
         hX3c8ofSjuYqGT3o4ZmAkQTMsVHX0pY5clCbc=
X-Forwarded-Encrypted: i=1; AHgh+RrjyG/5pxbHVmIZsCWYg+AHJTMid2KRjbTywOwH6O1+AnWvbBsbLqPzdQHn1IgHhiOSzRr8KipF/2E=@lists.linux.dev
X-Received: by 2002:a05:620a:2947:b0:932:de76:badd with SMTP id af79cd13be357-93302672fa5mr262213085a.32.1785249958494;
        Tue, 28 Jul 2026 07:45:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2947:b0:932:de76:badd with SMTP id af79cd13be357-93302672fa5mr262205485a.32.1785249957657;
        Tue, 28 Jul 2026 07:45:57 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de519154sm878659685a.5.2026.07.28.07.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:45:56 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next v2 01/12] wifi: cfg80211: pre-assign cookie for driver callbacks
Date: Tue, 28 Jul 2026 16:45:38 +0200
Message-ID: <20260728144549.2207061-2-arend.vanspriel@broadcom.com>
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

Having a single place for cookie assignment and keeping that
responsibility in the cfg80211 subsystem is a logical choice as it
handles the userspace nl80211 API. add_nan_func already does this:
cfg80211 calls cfg80211_assign_cookie() before invoking the driver.
Apply the same pattern to remain_on_channel, mgmt_tx, probe_peer and
tx_control_port by pre-assigning the cookie in the nl80211 command
handlers before the rdev_* call. For tx_control_port the cookie is
only pre-assigned when the caller requests an ack (cookie pointer
non-NULL).

Drivers may still overwrite the value for now; subsequent patches will
remove per-driver cookie generation.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 include/net/cfg80211.h | 6 ++++--
 net/wireless/nl80211.c | 5 +++++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 15c08b24502f..d503648bb25b 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -5107,7 +5107,8 @@ struct mgmt_frame_regs {
  * @tdls_oper: Perform a high-level TDLS operation (e.g. TDLS link setup).
  *
  * @probe_peer: probe a connected peer (AP: STA MAC required; STA: no MAC),
- *	must return a cookie that is later passed to cfg80211_probe_status().
+ *	must use the @cookie as provided which is later passed to
+ *	cfg80211_probe_status().
  *
  * @set_noack_map: Set the NoAck Map for the TIDs.
  *
@@ -5218,7 +5219,8 @@ struct mgmt_frame_regs {
  *     user space
  *
  * @tx_control_port: TX a control port frame (EAPoL).  The noencrypt parameter
- *	tells the driver that the frame should not be encrypted.
+ *	tells the driver that the frame should not be encrypted. When @cookie
+ *	is non-NULL it is pre-assigned by cfg80211; drivers must not modify it.
  *
  * @get_ftm_responder_stats: Retrieve FTM responder statistics, if available.
  *	Statistics should be cumulative, currently no way to reset is provided.
diff --git a/net/wireless/nl80211.c b/net/wireless/nl80211.c
index ac0c0da45241..bfb3005c23a7 100644
--- a/net/wireless/nl80211.c
+++ b/net/wireless/nl80211.c
@@ -14630,6 +14630,7 @@ static int nl80211_remain_on_channel(struct sk_buff *skb,
 		goto free_msg;
 	}
 
+	cookie = cfg80211_assign_cookie(rdev);
 	err = rdev_remain_on_channel(rdev, wdev, chandef.chan,
 				     duration, &cookie, rx_addr);
 
@@ -14871,6 +14872,7 @@ static int nl80211_tx_mgmt(struct sk_buff *skb, struct genl_info *info)
 	}
 
 	params.chan = chandef.chan;
+	cookie = cfg80211_assign_cookie(rdev);
 	err = cfg80211_mlme_mgmt_tx(rdev, wdev, &params, &cookie);
 	if (err)
 		goto free_msg;
@@ -16359,6 +16361,7 @@ static int nl80211_probe_peer(struct sk_buff *skb, struct genl_info *info)
 		goto free_msg;
 	}
 
+	cookie = cfg80211_assign_cookie(rdev);
 	err = rdev_probe_peer(rdev, dev, addr, &cookie);
 	if (err)
 		goto free_msg;
@@ -18574,6 +18577,8 @@ static int nl80211_tx_control_port(struct sk_buff *skb, struct genl_info *info)
 
 	link_id = nl80211_link_id_or_invalid(info->attrs);
 
+	if (!dont_wait_for_ack)
+		cookie = cfg80211_assign_cookie(rdev);
 	err = rdev_tx_control_port(rdev, dev, buf, len,
 				   dest, cpu_to_be16(proto), noencrypt, link_id,
 				   dont_wait_for_ack ? NULL : &cookie);
-- 
2.54.0

