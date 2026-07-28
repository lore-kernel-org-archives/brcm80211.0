Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15562EC0A2
	for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 14:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249980; cv=none; b=G2/NJ336FIQZw9c7BAyQUq2319rDTSz/vlrqIcSvS9UrLqqYwX1N82v6KgY1RrlOT4zT1CEb6JbBpJVx+SqxyBqhvQ06t3Vu0/ZBiu99j+yrom6nKjfyLByBGQ3YGDj7kMjJOUwZfkqgrqUwguJBbN540yc/V+8AnLST3H+AXD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249980; c=relaxed/simple;
	bh=YN70RHjCwmQ83vx3SX+04RYNQVnGpUEZQcVazfzYY2k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MyvSPJbz8KfiR84h3BONNTTHM5jS8rIDefCpbKLOjl7oijB5bREmqZV+oVrOFs34hlAOKQC3nHNjox2DtJDpNg6Mf+WvcLCE8+HTjRg2QwhM0I2q4UMWoqWbv6BEUqk/OD7W1WWYNZhEOEmqbvp0iQoT/VhXh3/UB9i49XiPwk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=GWfS6H2+; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="GWfS6H2+"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2cc891373e0so41256435ad.2
        for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 07:46:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785249978; x=1785854778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9mAAQLzPAI07RqkNYsgKLJ0dCN5z/oc54+anUQNCXX8=;
        b=GCBS+1pXMcCdGDUQM43/TydDz6vDjjJAzbcVRj1cGndxYgpCJVbIskkydrjQ9OVV5j
         wtl72/fF5islNEw9ZBuzkdYj93qp+mc8sfOkxHRd9vosymlS9/+/Etp7nG2vn1VeuTjy
         PHmtJR7K0fNGxokxxNU9sTOmOzMURC7k4GjGGQeLewZPZ6GYMTPWVeLPQFZ1yVnes/Vd
         Z82d34oep+IgezpzvID4z9uQc2FsV4gf/He0aU7s09z8p3Xcnay3hyra4a6uqXZ/eGjM
         N36FHc6wBBh+bl4vW6osZ1X0zB4VlP/cqQkThfd3pCRkI8PK2W6KP9zIeux6YmCcunT0
         idkg==
X-Forwarded-Encrypted: i=1; AHgh+Rozhexe0feMYLPVVfaIebznUFkaxereV38WmoVTkRbG7PqOvpE0tlQlOO1dK+Vd2mBLlh7uSuIlve0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJE+loi3r6+TSqUpKQW3wPmEKaPwFLHgot2vhGDI4hkZdS8uvI
	WsDIt73MSGgBfyQVO24SYBPcqljtvhidP1pQzrg6aXocxN3DxUCHxRZqa2/yQaT7rdgp6Bx66tr
	TV9YaGr+QikWrsTUSlNhC6wlXGPyTlkgaanFd+VmuPcV1yqb6Oq8RWczXj/9Eb8XcuRtSwMBnZX
	d4/HybSUrFYWb49hDpdp7rhNLpstCcaEvVXMpcnhZ1f5Y/idOr9IxSjaM4MN5ObN6dB4a4JrySl
	pDB1b+SB1CbNBbgILc3OQ==
X-Gm-Gg: AR+sD12ujQWv+y+8iNImDjyPw48AXA9KklL2FJe6MkEp5H1PCGkAMEBcChEbtzvO5XF
	Otlss2s+oT8VyN3BsR2OqKKzNSxnfW3nAFoKBvHYXTH6UlS50FtO3hb3Mp7+urBDur2MNPBVLqU
	P96cv7auyea1AYv6xFdHqOZ+wi1z5v/kbLPnR73kfZfgxEpHK3CM3AI9YJwYOJtb8axq2cDCLCy
	hopheFroVix/FkWby9LGf6XqitD9WYRrfZdmSkQ2YS6Isy/vdYSZaOEGkgafmBBgxC33ZANpVms
	mm8YoDhCz4W1jg65nnzQC896+5wWFC8jbxsgFPKKSLbJhdrh/ybgRJRHtIM6rtgoSXfCK9B0xPS
	eytP25/uVyc4FyfkN95PXM5Ki6j/r8Tb3WXwEYzbihusKdG7KPB1nSf4x/260cK5KUgcexOz5Bd
	HyVPVPV8WTsMNdqBibyW8ounq4yBmC//Zgh19fT5Q=
X-Received: by 2002:a17:903:2f07:b0:2c9:b48c:fdec with SMTP id d9443c01a7336-2d015c2ab25mr30476125ad.12.1785249978110;
        Tue, 28 Jul 2026 07:46:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2cfde58bd67sm10962915ad.10.2026.07.28.07.46.16
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2026 07:46:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9080b7b2f2bso22585956d6.3
        for <brcm80211@lists.linux.dev>; Tue, 28 Jul 2026 07:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785249975; x=1785854775; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9mAAQLzPAI07RqkNYsgKLJ0dCN5z/oc54+anUQNCXX8=;
        b=GWfS6H2+kO5FUmr/AZIz4Bv6RgVIlrrihOPlifPTcSg1vz05+d7PySqp/5mY4vYpWM
         CuKXInwTft1mb8L+vmq6PYgYLd2tQfQWFYaNwHpRCSYoNbu+SSHAMUT0n8kavzKHyKZ5
         7EbkayV47Fl1kTIWcrK98VO/PtGe/03Lot0OU=
X-Forwarded-Encrypted: i=1; AHgh+RrT85bu163a6rpwCX9usMKdU1boikDh+ABvJpNu65Z+PfvH4xL2E7ooWoETRA/RuDsXWAxBC9XVv2E=@lists.linux.dev
X-Received: by 2002:a05:620a:2993:b0:92e:6b16:6a0a with SMTP id af79cd13be357-933026c9378mr252095585a.40.1785249975522;
        Tue, 28 Jul 2026 07:46:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2993:b0:92e:6b16:6a0a with SMTP id af79cd13be357-933026c9378mr252090485a.40.1785249974891;
        Tue, 28 Jul 2026 07:46:14 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de519154sm878659685a.5.2026.07.28.07.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 07:46:13 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: [PATCH -next v2 09/12] wifi: qtnfmac: use pre-assigned cookie for mgmt_tx
Date: Tue, 28 Jul 2026 16:45:46 +0200
Message-ID: <20260728144549.2207061-10-arend.vanspriel@broadcom.com>
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

Stop overwriting *cookie with a random value in qtnf_mgmt_tx(). The
internal firmware frame identifier (short_cookie) is unchanged.

Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 drivers/net/wireless/quantenna/qtnfmac/cfg80211.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c b/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c
index 9e44c85d2051..284bc61c46d0 100644
--- a/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c
+++ b/drivers/net/wireless/quantenna/qtnfmac/cfg80211.c
@@ -454,8 +454,6 @@ qtnf_mgmt_tx(struct wiphy *wiphy, struct wireless_dev *wdev,
 	u16 flags = 0;
 	u16 freq;
 
-	*cookie = short_cookie;
-
 	if (params->offchan)
 		flags |= QLINK_FRAME_TX_FLAG_OFFCHAN;
 
-- 
2.54.0

