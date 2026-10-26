Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792993029;
	b=Fr3H1vJmJQ63WSu6kp5Zn9lDl1zhJAws/EdNNJHrHdSTSisqZcCngzV5rHecNmbpuIJA
	 b0YqqpYk/QDzavJgdQO8NbVM8d7jFmTvGguKE0M7oYdradbSNqDlq10BHdyZU/g3q9hcV
	 HMIlPrTSpV8yEzavb8LLPc+BWAB+lUIsIWdV1rTlI9RoIC+2oLqbmyPsa/SdaGCA5EpB0
	 Pw9uqTQC6VgAc/ru+Xm3jKuKGDztxUhRZaMMBpUmz9UYj/IL7aqS7WwlPdIzeSTJuSTqy
	 bdZO5Cou90/jphv8agppP0ovaMg6dJAZS+kWPFC6CxOIFHZ3GM3SgT3A6vsFbW8PooA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792993029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MS+SFJ9WWLq5oVbR7Ht5YirMH5w3cLZDi8sfy9s9yMk=;
	b=ThkzpcXCPI/fw4jkVsdwbVEZkQprRTCudGpOnZ2GTLnNicbE9CxNd/8wL3EgY64ZJyL8
	 nZHWg8IUDxG6lI0FA+lIRGrljHsT+GZMcg+kzRP5kkkTkZGmFMS0+M4I2kJWxJtNtItzh
	 b8h91D0wiE3xJLqFKn8V6A6w9n1UYMlFkwmcLR4zN8+j+wAOWEpia7dzo3uS7rhK5snYK
	 3ey9pVEZ1Dt9r7yyyPhDG9bSGl6EkCm4GWdjYqjHUPFuUrMlPkrh/f2ug2ylKTtSOZ765
	 kJfiuqA8JUHEE5JGlGLaVEkiVrhBSYKUS8L1VGnqxLHh59c0iVXuG8B27czRn/EmLxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=atbYaqJw;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797CD606A32D
	for <brcm80211@lists.linux.dev>; Mon, 26 Oct 2026 05:37:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 797CD606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=atbYaqJw
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a01cac8733so1898659b3a.2
        for <brcm80211@lists.linux.dev>; Sun, 25 Oct 2026 22:37:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792993026; x=1793597826; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MS+SFJ9WWLq5oVbR7Ht5YirMH5w3cLZDi8sfy9s9yMk=;
        b=atbYaqJwYFOn4QKm+meQUl0JBSXMADc6lwFQ+oQTcvGqkXyRffmcmMyR7uQDPaU5ph
         VMleaTU9hk+sAq0ZUbAV1jq/FOqt9E56RGhazmn+6RBg7zLzavvh/XiJsJwIOYHwt+nM
         Bouj9ZD+jQOIQFTuxC9l3co2XeHY1kTaUvO2Z2KfsUen1c6340XhtyY8g0FkV1Ya7DJI
         JeY+SQndWedjkBOBZUzzAzX9w/yfwdTE6/yTX6lpcM7RxZUzibGlK2sH4n3tjHDHgn53
         PkNCxdy/z2V33HoCsBaaXOi23BzIjiMncfH0FiujL6EDsWvmaUmHxL9j/kaDuzplNTeT
         J0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792993026; x=1793597826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MS+SFJ9WWLq5oVbR7Ht5YirMH5w3cLZDi8sfy9s9yMk=;
        b=NUr0D5N1Df6Kw/tjt41VcBuYw1pYEX9s6JL48UwLIkpT3y8nQFDRGTZUsHrNCAJunl
         /j7Dxctg+oBpEPTIKw04gIz498ofHyADgd4Ax9XXtVMauRq6bA5WkLL0lJx2Xe/pHmO3
         kKFdDrjS0Ln0BFzmcwRV6P1E2T6RtAvc3RJ5FnLky26l8JgXvrNHpqPl1N9OIe9VAu0X
         5DKA65RBvIpM0enrbeL3JFDdV2DrOYzJn1E0k7aG6fVM7nSsBiFVOYa4N+rS+x0OJYbN
         wPLnSTmCTtihw4taRMHYxlufYtaZvEVQZUybqiHyqsZVVyfVkj1ERYnn3am1sw2lqnDs
         YK7g==
X-Forwarded-Encrypted: i=1; AKwUvBzCcgWkQACaAmLAfnENbiseV1DuzyViUqKIR9/8rbUUxMTz0fkgOfsdjqWgQyL/H/pDpXMR6urD5YQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYLrtcLhmUCTAa/uZRJJn62JE3hPmFGDv+PTC0ZNhRlxFNmIo4aM
	E87Ibdz4xGyPfoLXj1xVj6TEhpqwUPMJHa3YRqG6cvTgFZMl7pMdDwsk
X-Gm-Gg: AYBFou0CFgsa7kb5lfQlplBRQa6H0kJXuBYRgnukvrOWTHKBMcWA6Oforr069Qf9HqZ
	Aql9i87zx+GacS4kG4CR3ppunh9JRhVDS6K5VaIB2jn2IfeixnsXPSVEwsOC6/BtARknjCyPfFe
	fJCW5Sj1Lbc5MpzbGhczkmOEpPYWpePHOiJP4FD7Nd4reQnMW93R9XxJUP7zRQpCV/GxvNL2Ccd
	zSNnLYeoYUfWu8FD2qFtPSGS2vzKn9zIlcdoXkRwl1k5ySWsoRVg9CnaYzbYh+ij6BxHgiMINVQ
	nveaeWxGtk1YVyYMUyCiUT3ymmd3JpDeFyEkUzVAfoyCmN08LuzWyfuxZvLuhQMhuOohkt1BOm7
	DDTISpHh1lkxWEXbV/LH+K150W+QV9LRjv+E8ReBHFJFUD/Zb4eSfYjVVTooQ564c7fLh80Dfip
	IWhdrB71ATaB0ue+0OpiGBBpABKZ/Wn8PC8McKxsHkj+UsYqV8QziqHG/IYmBiHYh5A9nQZEkbY
	V91bp9D0yjEGwrOB4KK2LJblgYfyYwO2WZXGM7igFiBRtujtX0XGmgBrTZ+yjGgIZ8qWnLoYONn
	2kH9
X-Received: by 2002:a05:6a00:ad89:b0:89f:ed19:f093 with SMTP id d2e1a72fcca58-8a36734e9c2mr4408014b3a.34.1792993025897;
        Sun, 25 Oct 2026 22:37:05 -0700 (PDT)
Received: from acemagic-m1.tail4fb79.ts.net ([2401:7400:c804:b668:673b:a930:e065:eca])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d867a0sm927851b3a.2.2026.10.25.22.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 22:37:05 -0700 (PDT)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH wireless-next 05/17] wifi: brcmsmac: round short-GI L-SIG lengths up to whole symbols
Date: Mon, 26 Oct 2026 13:36:11 +0800
Message-ID: <20261026053633.361454-6-ragulbaby@gmail.com>
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

The L-SIG length of a mixed-mode frame covers its HT part in 4 us
legacy symbols.  For a short guard interval, the HT PHY's TXTIME counts
the data symbols at the guard-independent bits per symbol, then rounds
their 3.6 us each up to 4 us units.

brcms_c_calc_lsig_len() instead divides the bits by the short-GI rate,
which rounds the symbols down before scaling them and uses the rounded-
up rates of the MCS table, so it can count one symbol less than the
frame takes.  Count the symbols at the long-GI rate and scale them.

Signed-off-by: Ragul Balaji <ragulbaby@gmail.com>
Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
index 3a383b0d1..c9a5877c1 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -7119,9 +7119,8 @@ brcms_c_calc_lsig_len(struct brcms_c_info *wlc, u32 ratespec,
 		 * the payload duration calculation matches that
 		 * of regular ofdm
 		 */
-		/* 1000Ndbps = kbps * 4 */
-		kNdps = mcs_2_rate(mcs, rspec_is40mhz(ratespec),
-				   rspec_issgi(ratespec)) * 4;
+		/* 1000Ndbps = kbps * 4, at the long-GI rate */
+		kNdps = mcs_2_rate(mcs, rspec_is40mhz(ratespec), false) * 4;
 
 		if (rspec_stc(ratespec) == 0)
 			nsyms =
@@ -7134,6 +7133,9 @@ brcms_c_calc_lsig_len(struct brcms_c_info *wlc, u32 ratespec,
 			    CEIL((APHY_SERVICE_NBITS + 8 * mac_len +
 				  APHY_TAIL_NBITS) * 1000, 2 * kNdps);
 
+		/* short-GI symbols (3.6 us) in 4 us units, rounded up */
+		if (rspec_issgi(ratespec))
+			nsyms = CEIL(nsyms * 9, 10);
 		/* (+3) account for HT-SIG(2) and HT-STF(1) */
 		nsyms += (tot_streams + 3);
 		/*
-- 
2.53.0

