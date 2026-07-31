Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F173544AB93
	for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 16:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785514037; cv=none; b=KdvuppYXlFCGySkoqS+h4ii0CRiyak39ModfbPGWCv/Xhd0BBNP5fKcl58GGq1U3J06gdQ8xgykEoZMic/sWpZsJPeaXZUGQKaq5CTrjHIKWK53i02eBVGH+2/D6wlSPmEy2DdPL5o/KIAkn5vDxOTWLc0x5g/dZ9gEUB7OlzWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785514037; c=relaxed/simple;
	bh=X64FuFu6MQR0e9YLwzcqtBlBGkOJCZbkezV6SD9jPJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P2I2LGEJyNURG+cnpfEoKh4onh0OMRYwr9XdGdlh+63vTZfTCXXbi4aY7Cvl4zHlTnNqUj5HW80UH1ZbF63dV1GkKL3YrjIQYCG3c2qA3/xMiG0UBAi0vQSwy4O8fIrWkdXIkLcNSKkVXjmIKQ+tlwSSo4ZW06iWmnGy6LpeTLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pkWoBRxj; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pkWoBRxj"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38eca09faa2so132552a91.3
        for <brcm80211@lists.linux.dev>; Fri, 31 Jul 2026 09:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785514033; x=1786118833; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CVffTg0thpytBoHWaWeNh2vyHkkqNffHnf4NKS93HWw=;
        b=pkWoBRxjXZBuYw66UE7JKjhX9PJ5d1fz1ZFzvs4DMQPXfomRqFH95JXwsuPrJee3ba
         zrU124J5RCNFlEKYFpyVvCxPGXxrF11ZD+qnQFHwF6ccoY/gxR6rEctocK5aDiVO5dAM
         rvvTtkW2DrYnaKylnnpsxku22mN/wJMO/kjfNmrJu+q/lKx3lQAKTF2R+fQ3G83oT+xB
         SmC+AQ7hu/wdMKm22A34tKINSfVgzvLjuvPHKZcim0obq+SirZ2Qm+tLa3o+WRqHObd5
         +RWumVXRkljS4lwmj85+5jGywp8BQhjldebv7dkgTa+08t9aQwVvbZ/TiEr4H0sR88ZF
         whZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785514033; x=1786118833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CVffTg0thpytBoHWaWeNh2vyHkkqNffHnf4NKS93HWw=;
        b=ooMW722rxXk/9QhWXhj4DeRWtm7cPrn1S6nzS6giG70Vleu7mHit5KS8yTeLZYM8Dn
         GQuBzPilsvtWOtQr9ynpLvwDhpKJaq+snceiRqTTOfoWBjlp1Z+zreEvgqk//Tkt7wcq
         FBFiEiCua2bL4TnPwCOdoi1vhqWkyoH4C9iLzoKoQs2fyX+DY60L1BIyBuWkRx30zdf8
         RilK4b0m8dk9MKw5FAjsMYBDdFDO4WI8Z4tgTGy3JMh/dtufXE/SggrKysjDCkPjQQpe
         5jFigfD1DHlf+VX4L6rysD7c8wxKRwkGzk0bYqdoeHG4xfmNKiNKNv5ic8u5J/241vqn
         IR2Q==
X-Forwarded-Encrypted: i=1; AHgh+Rqu3MBKl0ZqpDue+/ufm+oBc85rorQw5mVrd126JfhIkiLzwEiTEIxO4stFh1k7nghFMItA80+Evj0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5C500tfCqKmP3e04W/NLgHDqYvovzNuQcaqs+9/mfIa7IyI5c
	GdiEvbkebhRzYWq+bjBAAQ6aoEbqRAvjWHXB5dogTRdji+LBgMobvtHP
X-Gm-Gg: AR+sD11v4oe9RKHEP3JxKc6KV4rIuqFkXcerhyDaA7yEr0tRh+nEunj/MRmetku3sJT
	MZ866u69SmjZ9+RZL7ly4tKjLBdB39VxIDxRWu32W3Zi/0GJ7GViZn+Bn9L0i9jnnGYvwKi/HH7
	YIF7gx1xy9ZlQo5iE9GuKbZAfiEpWnEuIeQ64dsTxmyTNmfYOwQEOs/xzN7DcMrL0KykV5oieHy
	z9XrG6qiaWhypBFZ3JTbGskpTsJn9EgWVpWvEkIcyNmN3wgJSf8sdnexhGXoTgJwaOzm41PIcHr
	u9yL1PxciRLDINR+fzjsWzHSWFSSHjiEs9HdQfxu2YLPcN6Yr7n7p67P8/058UBldJ/0pWr/Xms
	AMG3PxxGGrjAnYDU8Bpc5e4ZZqgAx6CFYER1063oIvB64PQtQZ83VElcMsX8HdP44zUVm61eEsW
	CDDeVAbGGyOeHNezX2BIv01ZbXFhzjGkEyaN4udW0lKY2umJ9cEdWVCHZ9dEiDNhR+cjmxhQrY3
	awsiBgc
X-Received: by 2002:a17:90b:51c3:b0:38e:6a7c:abbc with SMTP id 98e67ed59e1d1-38fbc5482f1mr684483a91.3.1785514033358;
        Fri, 31 Jul 2026 09:07:13 -0700 (PDT)
Received: from Potato.tail66a299.ts.net ([171.76.83.76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm7881425eec.8.2026.07.31.09.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 09:07:13 -0700 (PDT)
From: Shivesh <chanelshivesh@gmail.com>
To: arend.vanspriel@broadcom.com
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Shivesh <chanelshivesh@gmail.com>
Subject: [PATCH v4 7/8] wifi: brcmfmac: fwsignal: document safe no-op for duplicate MAC handle ADD
Date: Fri, 31 Jul 2026 16:06:24 +0000
Message-ID: <20260731160646.3812-8-chanelshivesh@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731160646.3812-1-chanelshivesh@gmail.com>
References: <20260731160646.3812-1-chanelshivesh@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the firmware sends a MACDESC_ADD event for a MAC address that
is already registered to the same slot (same mac_handle), the driver
hit a TODO comment with no documented rationale. Per the firmware
protocol, retransmitting an ADD for an existing handle is idempotent;
overwriting the entry or reinitialising it would drop in-flight
traffic queued in the per-descriptor psq.

Replace the TODO with an explanatory comment so the intent is clear
to future readers and static analysis tools do not flag the empty
branch as dead code.

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

