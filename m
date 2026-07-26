Received: from mail-yx1-f100.google.com (mail-yx1-f100.google.com [74.125.224.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235A531D39A
	for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 19:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785093956; cv=none; b=bh16YISVOl/TRKxzTTTtDuiUa3zw+YHJtW6Ej0QqiRjY7sOp4k0oZ9P842OeXXQTpNMiefKY3rolMFwLrxFyj4WMbwp5T7pcvzaMdikNZP/uDvQmlj8wQOeXQFyOLyXcm7JeGxrPeTzmyi5Y52Hji360+XCqPVyYZALGp5cngj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785093956; c=relaxed/simple;
	bh=hcohRlpq8qr6Iln6NBE25urI5BiALzMz4vzUbZ3NqLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=inGhutY/Ke44444Yjl/yQCasVxPlZfeBx1y8GYJyik2QHmB6SBlDGBHEiPCk10vw8TTkExtEDNTMsVal6LaPiqgGWZlowirPfhHk3hbdYhclMQtD7bjmOuVOl1YISK2bRYqyuhBr2QqEWRcr6xSNFHR/eIlDnG8A+fXrxhUpZtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=RZk18dEi; arc=none smtp.client-ip=74.125.224.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="RZk18dEi"
Received: by mail-yx1-f100.google.com with SMTP id 956f58d0204a3-66807ba2f0fso2459281d50.3
        for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 12:25:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785093954; x=1785698754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CsP0cDJTGhn8IIzqW9flLkfEOO6Wkwk5wNmVMwSOrV8=;
        b=DEUWbP3JG9LQOsJrNbkHTUZWeujS++NexiIxHb6kmHvC0FtzTlyjY5z3fFC3u79I79
         BqMkOfGbC2an4mNkh822GtHv4rPfKkYNB7OIxCtwFxaOX/QQQ8xHq1b5GoWZ4fi1oFfr
         13HompF6DkFLseGaF/ftjaUamB86FK3rIR++JkQpJ/IH/FT27WvqRlC/jEUJm72lP7DZ
         Jxgpc9ZuGzyykAXb77l3dBf2ZEwwVzCSNsi+P1H9n9p2M6fDl9wv5nhF5ASRO/rkokhU
         h/rGlr0PuDTzgIHUjCOHhQ/TgfbaZzBxpzwyjkKfvbPou2tdFOPsbdaKec1mOxfEDaii
         LDCA==
X-Forwarded-Encrypted: i=1; AHgh+RpvNbn0M5dmWWhvp23uMF2BLuF86W3Ot8JxtGPqTdwZco9CdpnFCPMe8XPSnzsRVjOMCfD7mN67D4g=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2Pr9subHYNIB3O0+KAmFDkjunENAHB/EIGy/R5Zb+zLX/Sf06
	dKV3XhaG41s5XYiKBzAZKSesdOnJf9F13YrccskC0qWwszPYJhSPa/gNss47Z0QVaaLNmtGoFOO
	r0D5rH/0xMfTRmtCNi2bdM9m9hinP+Bxt/LBBJF1oFj9EOV8umGkC6DUVlhCKhQcXyk/wkiGA6o
	S1XjUbrZW1b3S0e0Yvxz+e8r5FnGhXF8v+Br3Su0k35UfQVY53x/DEMQePz8JOptUpwv8Vnc8HQ
	QFx/WyAWejJoAhv/uaAgw==
X-Gm-Gg: AR+sD10b7pSPseVc8mmVmo95HTZFx5xPOmlvxETvWmQLHGG6PEJdRd2dD9dfRbTWIqH
	FiMw5wKd8fKeMiexmdUtBpwvRnsk+QzezSXVIoEl4xkdxd9vWsA/pkB76go/1jkt9gYu8c+EXHy
	uvpuHPw15Y8k6MB9zKFu5y9XIZu79aMkLRgTxbkU0RICE5tJwS4hv6D/1mxYJ+07Uv0SP7xit1I
	w4zJii4pXQ8XxwlA2lx4nH8o/bA/8w1HErRnCF7fmVYlgJ9meVivZTNI+0Qlu8p/aX+smmVZesw
	au/5YVD6/tdAdVJOKx7g2cuuK1BKmL5g7ct3/atRQPi7exRv9sXysETOqGn3uhm+ab/7uz8uWsQ
	I/8wfGNq8jXDxA4Pj6wszwQaappF7MtSIleVLRVRa8XihQsWIzAAj+MYHz1ySJWH4NTKx1x9ebA
	krpxJ/rcl6YyJgvmG2xRHqq6W7NMzrgz8UiGhJQoo=
X-Received: by 2002:a05:690e:1906:b0:668:90cd:1a31 with SMTP id 956f58d0204a3-668c7c286f0mr2268955d50.100.1785093953881;
        Sun, 26 Jul 2026 12:25:53 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-668c6cfea32sm475981d50.1.2026.07.26.12.25.53
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 26 Jul 2026 12:25:53 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-381250979d5so172810a91.0
        for <brcm80211@lists.linux.dev>; Sun, 26 Jul 2026 12:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785093952; x=1785698752; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CsP0cDJTGhn8IIzqW9flLkfEOO6Wkwk5wNmVMwSOrV8=;
        b=RZk18dEimI5olcHxcb3RzX5FBGKp9+3DGk2IQhlsgcDpG86vSaTt6nxwfMXil/pCVI
         P3A6fPQnuI2cXuIV7Ma6YXlzDuL9BL1c3UmWozWnyGaiegZdFOrtI7iHSYc+o9feIdAh
         DEpdK9nsjBYXTUb+HGF3lT8R73Kh0OYwz3wNE=
X-Forwarded-Encrypted: i=1; AHgh+RqpKX/jIUlkoOTmBthgj1QwoSgckseHyErNCThzRvOwz+9Fv+6xA64gdlydXAHQIqK6I6SCYAAztCs=@lists.linux.dev
X-Received: by 2002:a17:90b:3c08:b0:37f:fd1f:d30f with SMTP id 98e67ed59e1d1-38f294ea11emr5530476a91.12.1785093951942;
        Sun, 26 Jul 2026 12:25:51 -0700 (PDT)
X-Received: by 2002:a17:90b:3c08:b0:37f:fd1f:d30f with SMTP id 98e67ed59e1d1-38f294ea11emr5530468a91.12.1785093951410;
        Sun, 26 Jul 2026 12:25:51 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm38355795eec.13.2026.07.26.12.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 12:25:50 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next 01/10] wifi: cfg80211: pre-assign cookie for remain_on_channel, mgmt_tx, probe_peer and tx_control_port
Date: Sun, 26 Jul 2026 21:25:32 +0200
Message-ID: <20260726192541.2816743-2-arend.vanspriel@broadcom.com>
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
remove per-driver cookie generation. Update the cfg80211_ops kerneldoc
to note that the cookie is pre-assigned and drivers must not modify it.

Assisted-by: Claude:claude-sonnet-4-6
---
 include/net/cfg80211.h | 12 ++++++++----
 net/wireless/nl80211.c |  5 +++++
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index 15c08b24502f..a30550f356ab 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -5048,11 +5048,13 @@ struct mgmt_frame_regs {
  *	channel for the specified duration to complete an off-channel
  *	operation (e.g., public action frame exchange). When the driver is
  *	ready on the requested channel, it must indicate this with an event
- *	notification by calling cfg80211_ready_on_channel().
+ *	notification by calling cfg80211_ready_on_channel(). The @cookie is
+ *	pre-assigned by cfg80211; drivers must not modify it.
  * @cancel_remain_on_channel: Cancel an on-going remain-on-channel operation.
  *	This allows the operation to be terminated prior to timeout based on
  *	the duration value.
- * @mgmt_tx: Transmit a management frame.
+ * @mgmt_tx: Transmit a management frame. The @cookie is pre-assigned by
+ *	cfg80211; drivers must not modify it.
  * @mgmt_tx_cancel_wait: Cancel the wait time from transmitting a management
  *	frame on another channel
  *
@@ -5107,7 +5109,8 @@ struct mgmt_frame_regs {
  * @tdls_oper: Perform a high-level TDLS operation (e.g. TDLS link setup).
  *
  * @probe_peer: probe a connected peer (AP: STA MAC required; STA: no MAC),
- *	must return a cookie that is later passed to cfg80211_probe_status().
+ *	uses the @cookie pre-assigned by cfg80211 (drivers must not modify it)
+ *	which is later passed to cfg80211_probe_status().
  *
  * @set_noack_map: Set the NoAck Map for the TIDs.
  *
@@ -5218,7 +5221,8 @@ struct mgmt_frame_regs {
  *     user space
  *
  * @tx_control_port: TX a control port frame (EAPoL).  The noencrypt parameter
- *	tells the driver that the frame should not be encrypted.
+ *	tells the driver that the frame should not be encrypted. When @cookie is
+ *	non-NULL it is pre-assigned by cfg80211; drivers must not modify it.
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

