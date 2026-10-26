Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993047;
	b=xsKpjKKOyY6ZdqGLOTDtyJ2kLg0D67746q6DrM+C0IUbGNgHibIHrH/29DWtfSLNFdz1
	 4vk2Xg7rj8QqqXdU6Ec4vtpvgzXp9ShqFN6k6ZyWlhG9MXpwYRKVLMTJxyYu7b//LpG4V
	 /vNSAN7ZFiv1nFV7JGGw4IGsXR6cr1HACSKi6Rj6bBj3BWzn68Ggwob9NxLcqhA/lgUa/
	 PrKfLwuMtPpG1B6myS8RRq8GCj+M23EBcbyB+CtL/HVcv2ye64owS85kDQHykh8oruFHB
	 HaNhUSJR1mB9HT2HP3HUNKAgQUxObTq8j7WogmJjMCXQ7ANxAJhRf/DyfNq6yxvHsRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=cdjemExUanYI/hEJuo3YfwdKRJvOmxKb9CCJzMVOt5M=;
	b=1/iHBp4W295aYAbfMXbP7cDAxSMz0BD+moZDHqxBiPYQnKEdxftbk1V9vVqsvktI0iGR
	 CSuXbYF8WoOC83yRaN4a29P/Wye+LmmMTLEVy+Abh7ZBwdd8rB4BLdoSvb5dwSE8nJ4Qd
	 WHokkUeaGYwT9KEIjAHGdC4zpBe4fjOF0e3pzcpdZnfJO4keeFqPazsBK+/BbBPoJLz57
	 X77Hz2T0jUYU2HVioIXG/ycdF2NxIBlXSrDl39xwwQmQfV0TgP1jZ3cmHBl/sSVcyTgnv
	 bMHAOexRxtNpZoJbU8QdHKsJ+eF9yHw1S37tlxGwHGnaQR1mDXCnvv96s2V6zUMKPrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="pYjaJy0/";
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1C7C606A33F
	for <brcm80211@lists.linux.dev>; Mon, 26 Oct 2026 05:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1C7C606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pYjaJy0/
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a070b3f44aso817809b3a.2
        for <brcm80211@lists.linux.dev>; Sun, 25 Oct 2026 22:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792993046; x=1793597846; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cdjemExUanYI/hEJuo3YfwdKRJvOmxKb9CCJzMVOt5M=;
        b=pYjaJy0/nsX8ymfBd29lMVh0kLZhEWZb5B6UMKkzzQ7fGucFQdyGueGqazHE2an3Y9
         o98I7/FByV5JFPHRbxa0M68+TlksLlP1r6ch+N6D6E2OrXdLwortaiA6dsOBrQ8tMr/A
         /uu6RQRATv/exy/8kcmP9sMBZydseSR/SXCRGkfapoqnBVLw6upnNd0sToJnpeEuzPfL
         MFuVREsAPhrgfY5ilrZ850ae/4tzzhl0B+MRUV/WlRxYn+hV8zXGVBi8izRq63iG25zX
         f0Dn4/1ZBuSlk8Xl9Xnmfkn/7qcdaXaR4DG0/Xg+8hYIFp0RHWxrfpm5srJqXFoSZ3ZA
         NTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993046; x=1793597846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cdjemExUanYI/hEJuo3YfwdKRJvOmxKb9CCJzMVOt5M=;
        b=G5Q29W6pFDdk+UEQaOJ2B2YssbhM6QCKCtreFlXfuqA0wnl1yr2pTsCBLqn/N0urV5
         1LBMyY3xceq6+7KQaKxR3VkRDLCtTSouN/I7kZdDsXP2SNdPIlgsIZf9kaLD+KDLSJaG
         S3tc6LVqebANDqJlD7Ird+FLU2IRuej+6IyxFP9WzKvyaExrH6V0hH48tN9rqh9HIfS9
         2B+kbYaGoTuBsrBFZGcuIyhxhioVXM76yWBOtDyolv1XIf+DHsFFyy0YyvyTQTq1myLC
         1/f+dey6t07lD0kyJRMWeDhpzymDVqUtqdUIoSFSn8j/f6trkD/AIBFOrDDdbc2qWd4P
         8ewQ==
X-Forwarded-Encrypted: i=1; AKwUvBywmPqA0EfUVnI8cKDTeqHAnFIkJgrGWeK6c1Tn+zqbXC84nlSsfPx7XFjqOuNLxsCeyctV4gPtR6k=@lists.linux.dev
X-Gm-Message-State: AFq9FYJah9XCNb0PvL76rnelici62CY9vIu8yj0N25xUOBg/o940o1ak
	f/heR+Cdd3cVIOfnLGQccO3AvMb6QwcnJkLDU0MT4jaFcnaJ8L80lM9M
X-Gm-Gg: AYBFou18xhXLvgyVZylRKdKU6+WXjOUFv/5aj4WgjL/S4gJYO7EkWuRAWCIaYgSyP31
	EJ7grJ/sFsqapHY9UuO4tNZTkFtDLHOkg1lJD2XriuZ7+odQ9BJMAoXaHH78VlLng0AAWzNTNw7
	1GWfD5ZZZYw64ONiCf/qrfHWjHTrCJK91NcVZIB7l7F9B6w8VbJC+vMKdihznKs3fV9Z6RT3jMX
	i01WNGEwlHLwsfKLAO8h3Hb2WZ3CpFGDoV8ojQNjlFNYClOmKe2sxbT79yckrZNxQ4Me+t0l5nL
	4trJq63YVw+f5l5HBCLGHQTdwgG0IwHY+almXR6vDo5LU7pWNN/Zt+RFsZLVsCmM6nZXduGQu1A
	n1V46j3JuBhWG/H/hvtGKOTM/EdwbLwTQ/x3YSVc3Z5ovg5MkRdAdxtwGz3LJbJU1FHY3d+LMQ+
	0d0UBUPVwIuKahgwZL2ODbyH5pB+lKbsOFtbavFbL9Sv0sN4XmffxQWPd3/Eq+iliN2nWc4P+cG
	k+y+pPwcetg7nWT2F2HkgyIR3lQGFthtrlhZ7BEtSxsPAb1hXfHfkDqKVCUPYh7R4iYgmTVVi1I
	GHNW
X-Received: by 2002:a05:6a20:3c8e:b0:3e2:b295:7678 with SMTP id adf61e73a8af0-3e7bfe01e08mr4900297637.50.1792993046052;
        Sun, 25 Oct 2026 22:37:26 -0700 (PDT)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:673b:a930:e065:eca])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d867a0sm927851b3a.2.2026.10.25.22.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:37:25 -0700 (PDT)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH wireless-next 10/17] wifi: mac80211: export ieee80211_get_bssid() again
Date: Mon, 26 Oct 2026 13:36:16 +0800
Message-ID: <20261026053633.361454-11-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026053633.361454-1-ragulbaby@gmail.com>
References: <20261026053633.361454-1-ragulbaby@gmail.com>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export ieee80211_get_bssid() again in preparation for the
new driver.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 include/net/mac80211.h     | 12 ++++++++++++
 net/mac80211/ieee80211_i.h |  2 --
 net/mac80211/util.c        |  1 +
 3 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/include/net/mac80211.h b/include/net/mac80211.h
index a1a6409b4..607369e32 100644
--- a/include/net/mac80211.h
+++ b/include/net/mac80211.h
@@ -6166,6 +6166,18 @@ __le16 ieee80211_generic_frame_duration(struct ieee80211_hw *hw,
 					size_t frame_len,
 					struct ieee80211_rate *rate);
 
+/**
+ * ieee80211_get_bssid - get the BSSID of a frame
+ * @hdr: the 802.11 header of the frame
+ * @len: the length of the frame
+ * @type: the type of the interface the frame belongs to
+ *
+ * Return: A pointer to the BSSID within @hdr, or %NULL if the frame
+ * carries none or is too short.
+ */
+u8 *ieee80211_get_bssid(struct ieee80211_hdr *hdr, size_t len,
+			enum nl80211_iftype type);
+
 /**
  * ieee80211_get_buffered_bc - accessing buffered broadcast and multicast frames
  * @hw: pointer as obtained from ieee80211_alloc_hw().
diff --git a/net/mac80211/ieee80211_i.h b/net/mac80211/ieee80211_i.h
index 1a6cbbb5a..ee3a49321 100644
--- a/net/mac80211/ieee80211_i.h
+++ b/net/mac80211/ieee80211_i.h
@@ -2968,8 +2968,6 @@ ieee80211_process_tdls_channel_switch(struct ieee80211_sub_if_data *sdata,
 
 const char *ieee80211_get_reason_code_string(u16 reason_code);
 u16 ieee80211_encode_usf(int val);
-u8 *ieee80211_get_bssid(struct ieee80211_hdr *hdr, size_t len,
-			enum nl80211_iftype type);
 
 extern const struct ethtool_ops ieee80211_ethtool_ops;
 
diff --git a/net/mac80211/util.c b/net/mac80211/util.c
index 44feb8027..182b41db0 100644
--- a/net/mac80211/util.c
+++ b/net/mac80211/util.c
@@ -104,6 +104,7 @@ u8 *ieee80211_get_bssid(struct ieee80211_hdr *hdr, size_t len,
 
 	return NULL;
 }
+EXPORT_SYMBOL(ieee80211_get_bssid);
 
 void ieee80211_tx_set_protected(struct ieee80211_tx_data *tx)
 {
-- 
2.53.0

