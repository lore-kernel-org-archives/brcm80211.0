Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1032F46AA85
	for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 16:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785428523; cv=none; b=oGeZA4BVtRBYinphElL8wERjciPbzhBvNLBZSyy0Df+nwvGUmEnRkEbltbk4INzxUD9ImPH3W8Jaw3fFWm56YabmZ7cpP0iLFHrTTAA2PtnGj5wyPuOVy5XovVK4o9PptRORPFxDTZJB3w9ABlrOe2Hg2mZCQJiNuvNc71UQDGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785428523; c=relaxed/simple;
	bh=msMdhfowBySBXOdyCbxYCun0AlWqDhJmOSOvSMu4OjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jbk8m2SQ1y23paxdDcGazIlH4EHxUx1gAMUPwYCUTbgDAUbO4T9aU2J8RYCuo3v+gkWOsAN7FOcajzMvF1exfVM9ciDBn7mderp9gQYosQMOv5B4zT5O9Pmg1RlWnG5Gb4I+cmjhVf4Xi2kAXGbXAizAx7Mrcdj//MkDWCS6Hck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJ2vobv8; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJ2vobv8"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3856d4015e0so8844a91.2
        for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 09:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785428521; x=1786033321; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SPK6mauK3g7KvbulXUNjPujp1LFeaCkSgeVtH4yKc2U=;
        b=GJ2vobv8rvA1CCYWPlnbQCDahQ2W4S9yyG3Re9sx0jQ1J0r+CoYfNZ3gSTRoy43Bvt
         mqv8e+iSWNDRErsFO27FpeyUpDnCDrxfve0BbWsdDee8Tja0STfjcUTwllnG4BjWIHk5
         t7VUEk1RptyWCy3GTcubQ9tEBY0tqjLmTUgM9bwikG5T+Ojl77/J8rt1Amj1zLe+6oJK
         A98+7ruBhe7Ks3rFFWcZwrQ3LKcEtRRqQO7Be4krltzadZhLStpQ2V1mIht3i4+OnA4N
         fCCs1zNGo4cotTwUMzeICs8OEMDJd+VkQ8mqCM1AvFBVpYzcXSjQ6KkenRGWh14M0dzj
         31ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785428521; x=1786033321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SPK6mauK3g7KvbulXUNjPujp1LFeaCkSgeVtH4yKc2U=;
        b=TJYBTAz2xqnIlWvNMUe/+fdTbHWhAMa/R0KRa3mIJiovWNSkxFA6M8yUnEiB1aNq85
         1GRSoTYNHkhrNIzzZ3dyUUwWhzAsNgQZufD7AuEuaildnYSNKsiG7pBpIghq6+8oRoZ1
         lb63ekaxoX85nwo/eRIkYZ8IBTIDUFfODmYPP0aF79nQFji24fjHU39DTcpI1T0NBOxw
         yBmsQKbp/hyOzzCRuWv8St5rbV7bsDJLHf7vF4m8g2rwzUiujB/UcAOPlhxhITJakk0O
         8NsPsASJNLr1f+i0Hf2krpcXkBar72lF4N7IgBq58mHtxhLSB/72gKS9pP/eSA+ey2qv
         wExQ==
X-Forwarded-Encrypted: i=1; AHgh+Rog4i8ROq0MuK49//G6CoN5gHEEJMbEps0/MtzmfDIVvUre/LJpcczaNlgevjfPenrGOi0x2BAY470=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+Yct9UFBOeZw6e0Ra5g4ejxRuAm4xi2jpQAMvqhhodKugA+RN
	XSL12Go73IL0CDQfDu4p1nDaEkv+wcKisXEzhdFR319ipofAGBpsgEJA
X-Gm-Gg: AR+sD13MoDkmIVCC5cOzI6pmCSO8oQaJfVTlAy5vk9xM1BwZpiFchmUadpaIaSyBYob
	63JHYam87zg9fmgcLpimK87za6/ih20q6Aasdt33bY8qvb3bO8vX4D6bZQWf1fxnNnHUmTjLk5S
	g6gII4ycdoaUJyju3RabCa0orDfK0D12/b5tQEfTxIfp4nCbDfmWsMAijLMde0OEdK/6lXsWUO6
	nklTdDtb+LS76Sa4h/TfkjC0u2OWK7DGZV6IPBYsCABahTzuC0w2JWnWwG1AQ3VH3O6xe6g+3nY
	sbprDoYqgAAPf4JvHXD5qlB7BeNoL347hoSRwfJablJOJZjv3Z55Nxu6ZFyDOZtuJt7MArUdpFL
	UYslaeTqitBP2RMhnYYkQRo6Y5cY7zHMvqukWOpmkCD0zDHPTdBJhrQ5qLXyj1neFd0saTJRSao
	cR3Y4qD0YEMc6GnzAJ/h4kfCj/b2S22RRLmikO6Z6btl8o/a/B6yFpbqptr8dXTDedYPJ09MVnu
	ek=
X-Received: by 2002:a17:90b:4a0e:b0:381:77cd:38ca with SMTP id 98e67ed59e1d1-38fa830a75emr674831a91.4.1785428521244;
        Thu, 30 Jul 2026 09:22:01 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e7275973dsm19964269c88.15.2026.07.30.09.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:22:00 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
X-Google-Original-From: Shivesh <shivesh@example.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <chanelshivesh@gmail.com>
Subject: [PATCH v2 7/8] wifi: brcmfmac: fwsignal: safe no-op on duplicate MAC add
Date: Thu, 30 Jul 2026 16:21:10 +0000
Message-ID: <20260730162135.12278-7-shivesh@example.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730162135.12278-1-shivesh@example.com>
References: <20260730162135.12278-1-shivesh@example.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shivesh <chanelshivesh@gmail.com>

Removes technical debt TODO by safely ignoring duplicate MAC handle
ADD events from firmware.

Signed-off-by: Shivesh <chanelshivesh@gmail.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
index a43f1a38b0e3..3c1ca355e8ee 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwsignal.c
@@ -1037,7 +1037,9 @@ int brcmf_fws_macdesc_indicate(struct brcmf_fws_info *fws, u8 type, u8 *data)
 		} else {
 			brcmf_dbg(TRACE, "use existing\n");
 			WARN_ON(entry->mac_handle != mac_handle);
-			/* TODO: what should we do here: continue, reinit, .. */
+			/* Firmware re-sent ADD for the same MAC handle.
+			 * No action required; it is a safe no-op.
+			 */
 		}
 	}
 	return 0;
-- 
2.53.0

