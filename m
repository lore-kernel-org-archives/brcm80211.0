Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B7C1DFE05
	for <brcm80211@lists.linux.dev>; Fri, 22 Nov 2024 18:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732298687; cv=none; b=CPkpdLu0TuCc2plsWCUw7Oa3lKAF33PNIyJ5AtnsV3pJr8q/NrdXXGm0SkIFOhUYvj4UwnpUGSJ8ouUO1P+ZnVKPdE5hbNFM0cTsMV4v4r7N89MOhgt7LRNjntaw8IO/RA+t7wQ9gPQCpKr3cnyN08nyJj5VLyo/iWsgkjbth64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732298687; c=relaxed/simple;
	bh=GE9aQ4845Qpv/Mv6MUtLgA2EMelQ8RiZvoVebfNEeho=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=rOA2Dxfg0ORBPVITg7g2Ihn3fB8fIgIeRHx8BejyreUDddEVV74qgUVc3W+4mcQtSNF8J8y5xRv836SLb8Fq398ypUAATA7KS8yrVzBMEQTMtVQv32PCKSiyoTM03a3wivy7RyQMiv72KeEgZDcPTZTAI2qPsh/Lg5qmnrm7iGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ey1Vd5ol; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ey1Vd5ol"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb59652cb9so27274661fa.3
        for <brcm80211@lists.linux.dev>; Fri, 22 Nov 2024 10:04:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732298684; x=1732903484; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kYyJYDqDJe69p5MWqb9Lql4avTJsJYhKFAm40pVHp2o=;
        b=Ey1Vd5ol9kamJ6WpEF6tW10+dCY2UBkx96mBODRGaQNRANnvnczQd2LLoEZwrt/8qF
         9IzEL0jgy+pBkpmH+iO7G8rEgRqvQ9n0tSE3ripctiw87suF7Za05lL1PnO6hCIv0MbT
         Q/gcEQ9nQ4hh8AxMCOXno7Bzg5j7sykG2lXTCTegqhHCIcRSwWNUl7c7iqsfCbKMP9to
         fJqLvAKN+motlx/YNBFWpCu/RAImlJLoIGlflDOlERO5Fh8FczWyjTiN2tK1mYnOLOQ+
         0gyzHv2jE5nigz5I/65U/4ZhAEoSmCr1p2KwPjGYpRk7Ff4rW+Bklzli0zTQqN2kOV+1
         09mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732298684; x=1732903484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kYyJYDqDJe69p5MWqb9Lql4avTJsJYhKFAm40pVHp2o=;
        b=OFl74DPp6t2m62GtAiNZD/c3dxPmEPFUblGVIydn+qzCcaZQvoZ6lxkJVQ4rO5/i8t
         AYK+dEwdJxkeUEu/q6imIV3pqaiQ83X3fiyqgGJQ+XEUWrnH1pnfCKxtdehk0oB82rMj
         lSCb/Hy8+8B9RIl2Xmix9tbzAv0iwGMeqNJqI4eK3aOj4CFJj92cjlTTKjOGQ+KnDTtX
         IdSH2AgYKORlrV32ZlyPQPt+8qfnZOtUYpkefkbBjvGf8AEHiS3N7MHJPPcA7cPNFibN
         ys56SFKvCXaR+O5en5Sm1Vedmjis7HIqjSqm8+wBc66M6WVh8TiyyQjJeI/Mr5bhl4CK
         pOug==
X-Forwarded-Encrypted: i=1; AJvYcCWib4Nqz/4D+8plboO7CcC/YuMyVKhZDcWJs9aKylmzd1hAvYSpKA8q55Qw54ra/cRSmvywAI5pR6o=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAxZ6OpC+N+/yfZBnKIEqAbuyxcmDXU69i5QS2avrqJIY0GaFn
	6JPIIFtI3S1rT08rEaUbQueV3IykYPj+DS+zPuq2rsEPBbgSxSjP
X-Gm-Gg: ASbGncuudxUXXvG6vVeg3VLOvXjRlFi+mLUxtt3xZNHhqlddYPaBg4R1Yso8aiHNcHV
	0944tjGP0iCNED0/Pe6BJ4BaQULGnt1lCVf/u6RwezcxpHh7fzzk7HeiQqz/ZxLLeT2t61ICCrK
	sKc+TBnTbSzKeshYUY3mPSzzHbZUJDpoLdOf0SBixCMIaLcodPOS7v+lz7i+WhF67y/dB2DA59F
	H3b3vGbAlBdawNVZKHGVNbdAu3+NUDiOo9HJc6FBqcGrh2xoJ+GrOp4dhg=
X-Google-Smtp-Source: AGHT+IFMT1jZ0OG+uq5izFMfMfSmIicgWhHMQIScinvKrk/fbovg8oIImmx/lrryRLrCRN/udLycOA==
X-Received: by 2002:a05:651c:98e:b0:2fb:4982:daea with SMTP id 38308e7fff4ca-2ffa718296amr27123141fa.32.1732298683522;
        Fri, 22 Nov 2024 10:04:43 -0800 (PST)
Received: from alex3d.netup (team.netup.ru. [91.213.249.1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ffa53a112dsm4330891fa.119.2024.11.22.10.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Nov 2024 10:04:42 -0800 (PST)
From: Alex Shumsky <alexthreed@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Alex Shumsky <alexthreed@gmail.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Kalle Valo <kvalo@kernel.org>,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: brcmfmac: remove misleading log messages
Date: Fri, 22 Nov 2024 21:04:35 +0300
Message-Id: <20241122180435.1637479-1-alexthreed@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently when debug info enabled, dmesg spammed every few minutes with
misleading messages like:
  brcmf_netdev_start_xmit phy0-sta0: insufficient headroom (0)

Do not log this when headroom is actually sufficient.

Signed-off-by: Alex Shumsky <alexthreed@gmail.com>
---

 drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
index da72fd2d541f..25c77014af9c 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c
@@ -327,8 +327,9 @@ static netdev_tx_t brcmf_netdev_start_xmit(struct sk_buff *skb,
 	if (skb_headroom(skb) < drvr->hdrlen || skb_header_cloned(skb)) {
 		head_delta = max_t(int, drvr->hdrlen - skb_headroom(skb), 0);
 
-		brcmf_dbg(INFO, "%s: insufficient headroom (%d)\n",
-			  brcmf_ifname(ifp), head_delta);
+		if (head_delta > 0)
+			brcmf_dbg(INFO, "%s: insufficient headroom (%d)\n",
+				  brcmf_ifname(ifp), head_delta);
 		atomic_inc(&drvr->bus_if->stats.pktcowed);
 		ret = pskb_expand_head(skb, ALIGN(head_delta, NET_SKB_PAD), 0,
 				       GFP_ATOMIC);
-- 
2.34.1

