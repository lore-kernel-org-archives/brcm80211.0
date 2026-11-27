Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795759994;
	b=rGnL8YoWfFXwMOavhXmpEmw+jjOvMVmbJh5fdpNahiVgGpBCX6Dw8SWqqTdXS50ZCrcA
	 DBJB4FiCbL/Ts3HAjeI+DofDrbPHPKv+MBBbfP7Qa7P8MR7Gr8hjGGU26gLnni13IH7S2
	 GHz8+emE8KBI9V9Fw8QdkFyAOO/EKkvrMpd65PDWnS/3HCSABAHSjWMX5SLmjo+iW5jPN
	 DKk/Jxa60nrG1m7qxkyXjFHxHAU5CezY9ZRSbzTmasHiPWd7UDhwCLX3dTLuwVMe9s+W9
	 yFSTwOGwHYODsDYrZr3tZ7RYga63gT8OW3FwjcXqgcHc7lJikII7jScUtTen7I5OUTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795759994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4PUyXRGVtsqAXg1S2nCpf99C7iQB357SGQ9hgLA66kM=;
	b=oOd+jGahAz6Q07uaOUEo+0/0YUazLktj/J1wyt+zq4REDz9GBS7UgqpPqEEFgY5XCzUU
	 zvrZ7prejx0rJqopYuWM8XRmzRW6q2Fone2A0kqLtWr5Aj+W3iKtLEQgNhaXr/kZ8sOp9
	 EGbo4E8GLdUeUqDoyFBKTlIIZtN/WoM0P4JbDpk/BjUzcKuhUKKzZL3P+iyWeWMVuYJyR
	 Bn/iOJaF2VYjbwRtmRfR8o5p2uhOxPVsbwsn1z5+AhHbbaInVk8mZ75w/hcuWX8kHRm1P
	 ip9TZL23BbfAxIpm+jNop9Qfbd538XY0ZvHjfYRNhan07/J5H8Ino5kjVHDaOo2odhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I3bnrw+c;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42647606A331
	for <brcm80211@lists.linux.dev>; Fri, 27 Nov 2026 06:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42647606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I3bnrw+c
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-38692f62b22so10285166eec.0
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 22:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795759992; x=1796364792; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4PUyXRGVtsqAXg1S2nCpf99C7iQB357SGQ9hgLA66kM=;
        b=I3bnrw+cYASvnjPXVI2MnCCdmqsQPGBOVPS22OTDPAUhAENPrfk/QDHd+2PERVfknK
         6BsxWby8s5AK//nvlJxYyuREFWmpDZ0F4Volgn2I+BJ8uWYMissr6VqYqnYdgff67clB
         nCCtFVHgMIM8bQmQMhhtyM6jvrwEt45gD/po3tArS71G5qaTRlgN8cakqJiC1YpoAYG9
         vtBcoSsV7ZV5YJT0sMYh91K8cpnbNLoPTqz44maGOUmbHVpttFV7N6d+RFQ5sgjOX8I5
         3+P7uPOvodh/z6P/ES9K/tTmFgQPm8Kj2cfnEP5+MklhXu2vzugP0fy6W8BbIChXIBM0
         IkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795759992; x=1796364792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4PUyXRGVtsqAXg1S2nCpf99C7iQB357SGQ9hgLA66kM=;
        b=BPXePYq9/DzVOVktdUhlxz2jvaw94JhMNY/8rhAR27lH1c/SwfVIM2NGPss78h35Om
         up3wqijztVCy+WW596gFzbDC40wN1zEHVi7kXR9P5Ma4R+LeIUSKU2GeNdm4igBxJP6X
         ueL3D7Jkfci2OHPS7XWjdcU/ZvY4m8bxQCaPtpUJL4KcTmXLt4sskAyfyYM9820ZMcik
         psVFNJOD1c+BCoIsRVtziD6eCTPFxRar0ipV0hRWwY/pZkAGU1/hDuiZiYKCkVUhnDY0
         KovINNj5OWSRyMTCJ3GI9h+UdBqbNu5IQI5uGJTR9MsPf211D/bLknJxQj197zzB59tS
         /r/A==
X-Forwarded-Encrypted: i=1; AL+hErFRgl3gcUNjnE9XBdIr9ez9OlfbZKsxNvIxer3yRgLk2LvWZJY+Rz20gG3DFVSmPiLDSKz+m5wwXYM=@lists.linux.dev
X-Gm-Message-State: APuU4Z+MciHxBBdx3edkVVYXm9KS2wlr184EUf5BW68KSPugPjCoEuWV
	BkXXhTyK1Fshq8U4tVM1/0H6S9sNvUm0Bn3wx996XIN5RR9vGrCIXgCf
X-Gm-Gg: AZFdTZc+PfZPy/0c0ifkAwiQVzsOG9rCtdQy68KjfDhOiQ+PGA8keb20RPyr8W3T3el
	p5QaS4GFaQeqMYx0qUWVKZYtk5QiQ5neBfHKMvwvj6kP1hkN3+g2yHM3cShX4Pwo0j0vpGP+j97
	o+M8Lzh1eClYLjpHsm0aCv9pNR92mR9HVkgdvBflkqpNb/34lL/ftMY0Nfbm/Pe9XL9AigLz3Gq
	iqZZcszry1RMsqBKdK5VXYyPKZdhJwgtbenDLgUQ1Tjw659k/Fgmznld+osaM2rjTSF5NAubcyd
	Yv3FkabT9YHWA+MSSp1OLqWes+wfpJ20JDJzPSYzI/bNcJFx6dU1XoqxPIVMTGaMVuU67DLbRRn
	JIKrjTNvbwUx2ElZouNLjsTq6tLViTNkpfyBdGNVPZ6fGiW1kRc0u9Vmt/LhHyGC8ZysYKFOIyt
	M/VzDqVpIWumaF/gj04NyQKPYntL2h4op6ewrCE/wsBmqd5jEbaghg9SySHRZD8/RYk82hSD+YE
	yA8dMkuzKtFCH5p4weYgvCIxoLGAtxwzvJqVifMxehYAvED9BAVvk5xCoPAeTpPjP6/cEd+mUYC
	NEZK+pvQEkgcLI27e7u9gc4rEa3KaLmngbc1mrwO6Sp5lrvk0PBZvP7/iUAsFkGlkAGwdQ==
X-Received: by 2002:a05:7300:2209:b0:386:8d2:929b with SMTP id 5a478bee46e88-38608d2945emr33877729eec.23.1795759992402;
        Thu, 26 Nov 2026 22:13:12 -0800 (PST)
Received: from acemagic-m1.lan ([2401:7400:c804:b668:d6a6:bf90:ed18:c855])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386aaae4960sm40300425eec.18.2026.11.26.22.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:13:12 -0800 (PST)
From: Ragul Balaji <ragulbaby@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	Ragul Balaji <ragulbaby@gmail.com>,
	Ho Jie Feng <hjf3108@gmail.com>,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH wireless-next v2 05/11] wifi: brcmsmac: round short-GI L-SIG lengths up to whole symbols
Date: Fri, 27 Nov 2026 14:11:35 +0800
Message-ID: <20261127061147.506129-6-ragulbaby@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261127061147.506129-1-ragulbaby@gmail.com>
References: <20261127061147.506129-1-ragulbaby@gmail.com>
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
index 46116d66f3..659b37bb43 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c
@@ -7114,9 +7114,8 @@ brcms_c_calc_lsig_len(struct brcms_c_info *wlc, u32 ratespec,
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
@@ -7129,6 +7128,9 @@ brcms_c_calc_lsig_len(struct brcms_c_info *wlc, u32 ratespec,
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

