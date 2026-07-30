Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C62468C28
	for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 16:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785427492; cv=none; b=oz19Qr2d6P/b85z+K+7k0o/+6r+0gU6OLjkfCrCxyy4p/xkqmCPzP5KR9h0yplKrB4OOaU77Aa/ErpPYfBDi5gYgwyFClN/fCIpHc3L9NG2fu6OGdtNuo5sPyfTMvQbo/1gZB+hhbILDgT7bZDvD2YTgqAIKhMdJsoPVaJNLMww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785427492; c=relaxed/simple;
	bh=Ha19f45cKy4P+0OsFEr+btZcY5O+YERSKZjpgYlX3f8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DtQcqcR5FSr/QhR+hkTDoSeltn2N4zazMx+89KjRcnt9d/FFbBIcFphVxt2Iv7uHs9Kt7eBNkvteRyvWxsSOqTElTnz4wMGdE0mZ2p+KvaJB2DZa0ipWMY+itfBgtUG/vIgNxIWeYRHCsBngu7fpg57+T2lJC+VKGZExHe4mnWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Har3CJoX; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Har3CJoX"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-384422b05b5so3978a91.2
        for <brcm80211@lists.linux.dev>; Thu, 30 Jul 2026 09:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785427490; x=1786032290; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ts4xsj5jidC5xPXZCTNfYevbfQH6viS7Pn42+gUfDKI=;
        b=Har3CJoXqiuqJy4BLy+YI2FQTDp/PClqT6Nn9qAzd1h04pFfd3VHWLX96PEMZXraKX
         lN9hSwfxmCKNeG/9OkPaU5d0IaoVVrJQjcrfendXUPZ+cEBVKcATEgZmawoVl2x4dxGM
         yO5jzOcZasiHw/RGbbamzHhYn8If4z1lQQPdFOcB96bSMZHrLLlKT8OYlh/akl657afO
         JNhfkxGkDPqjPnePD4MY3aAligGHbdQUPcDLVLwPEhjYBPIRa7vVlYxd9h5n4rjYoVwX
         UGz0KN85TFRO/H40/Aq1w0juBlHtFGV+zzILhQnr+wiu92bYBpe2nQHlD4ZSAEFBzrif
         wATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785427490; x=1786032290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ts4xsj5jidC5xPXZCTNfYevbfQH6viS7Pn42+gUfDKI=;
        b=NHQHy6X+ZSeAL0fJCe0kdZK5YFA2rwKJxjF+ZoAknQTto0WgZlUit6a6FFS3O/8p7h
         4E7vWHsxgr2bDAgod80A0MkrvgZVTVkV0R4wIHN2G17lR0BEYpsmjin7qJjTTsTOlIbu
         9F58dB3gKrCl/fanRnLbj5u3drLs4P0oToipmXpup2pouNqhFUDfMeZZygN56U79e928
         U8OBK6LmxVd1eqZzYDH0aUSASEYArsty1usSKeyVY6QeKXmANs1VCGYWy+BuVaKV2v5i
         LTupaWZRVZaoMUJZL+eK7sq/GvMlQuZ6VAnaNwDBlQlZ4lRDrWFKwKU/j2bAjXf94zWV
         5VZQ==
X-Forwarded-Encrypted: i=1; AHgh+RpyYMhNDpMiRsFjxbN1C5arrnr7TdCUM6HBRjbOQZVlGxqMf1XvQyUHxVxrC6qzHqvs1z4XgJXUIH0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyhHtT6CQWRV0+t3sMl/M/gPEcKhXNcvmb+bDVYXEPxdb6L5jNH
	VPnFikBxdt7flg4UIlBGY7jGCCVwktP6csvggA+uIisKxeQcmU7xkom6XIKDdB2E+7k=
X-Gm-Gg: AR+sD11O2yfzy4unQnTidLSBJT+fRxywwuFKOBl0n25m3Zco2/vUwreYHx/xZW9ukHJ
	+b+TAJeJNT6FFaOYn7HLUjZhJ5U1Z4Ri82vBq9FdngUeohqwvhH0pJChQ1ULRzm50TexKnO4eSy
	VjGontuToJkWOcR093cM7qmYSJtbNYbiHFeQCCR42jjWfwJA4ZirbvjigAgsQXyz5VV2WhEWkrw
	vYpkJwPogpJJm/pdbRN8u5daag1mHe8fJgLB3Z6YTLeuaipKJfNJTmAjz/FyeYb2jEF5AtB99lh
	KNKEVwL7qDia5TxsfOVpcCGZzFw+kPs5s8+Nxb9+B0TAeLGQuprTf/9LIQ7EPiOR3hFl+eh8X30
	Lq0V9mAII6U4uZawUImtP+gRl2ITs0v9lWMBemcA8iR+FDe7GfDRc/gznE1pSXa3w7q6suNfkX2
	k4CE505qlJo8XUOXcf+gVcyEWe6j+3yHefwkESmwRc6uzodLCR9WdMVbHAFWY6oa3jekVRqd20V
	cc=
X-Received: by 2002:a17:90b:1f82:b0:38e:6d4c:14df with SMTP id 98e67ed59e1d1-38fa7f26f3cmr902246a91.1.1785427490492;
        Thu, 30 Jul 2026 09:04:50 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72643a12sm35012783c88.5.2026.07.30.09.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:04:50 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
X-Google-Original-From: Shivesh <shivesh@example.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <shivesh@example.com>
Subject: [PATCH 7/8] wifi: brcmfmac: fwsignal: safe no-op on duplicate MAC add
Date: Thu, 30 Jul 2026 16:03:55 +0000
Message-ID: <20260730160425.11933-7-shivesh@example.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730160425.11933-1-shivesh@example.com>
References: <20260730160425.11933-1-shivesh@example.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removes technical debt TODO by safely ignoring duplicate MAC handle
ADD events from firmware.

Signed-off-by: Shivesh <shivesh@example.com>
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

