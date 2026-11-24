Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551240;
	b=FX9S3Jzsu7+u6IlyPdMINgF11FA6WXNVZQdeTAIPpzdTD6kEk0c0TcBxTrkrZv1pxc84
	 EDjAt7YerTsezCU1NidNqgt2q/HALAy578KaqJbYozjoFtOkBZZ+2152V6HgDvXgsL24U
	 HqhT/EqM+tdtfTJ51nGANHNdD1WTZih0SV1LrS7j6uNv3VVgs5aKLXuMB0515V7v3h5cm
	 z+yhw51IpItRW28/jR5YDk5mzIomjslZi1CQHKSl3Ubk7+QXgi178yuSPQuUJf+Hip5dU
	 sCMNgDNFJDMeKec5UGJoO0N5FdTLBYQ57TmpNIxv1v0nenrBg0FlaFn2ImHq/g2VZ1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551240;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=Jp63++EtQIRHNWdJg4YxJkwdYNnnCNo4XlfBjBOr4mc=;
	b=i1Kq/q1cC0G9U69xZMsHpy9dgn7YMT3P/SIcyv9gJcLdcCaxTBNgFqxL3Q+Bpn03ghH0
	 J+o3uTM6gLtSpEU3DJFpDAGqV6Uw/mTDuDyvQDY7fN/wYRWmqv32i3WV8UMXbVwwXERkN
	 vUP8h0PjdawFGECAxoLMbmdV2I7LsX17BtTYpt94S7+R2NhZJax8LY6PD9tYt6nFgrOUe
	 bSXXx3SGHQQD/8nUaE+Kh9hrxfkX1GPHLhZeVxWI5hx1e0ocDeDysMO5fralD9EIKbquy
	 1lnRvg6jZLrzf1hgetcYo6N5H7HJwuHE/LNrp/svJlYrDz3j5e7MtOS8ZTa+kU/rqeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=U1H3pj5D;
	arc=none smtp.remote-ip=209.85.215.225
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E776606A327
	for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 20:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E776606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=U1H3pj5D
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-cde827b7b95so1290836a12.0
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:13:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551239; x=1796156039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jp63++EtQIRHNWdJg4YxJkwdYNnnCNo4XlfBjBOr4mc=;
        b=agcce43pfhd9ZtlN1b1HUc0LeyJZYtDNy/w5nMPRCSdtwkIdpQ9qK6kUqIFLioUGrm
         d1opHYwPSX3c2dSTcVqKTL1fD0OidaGv9VwPVsLPDRBQ01UZ6WtYKXrVfogQ8lzg6fNF
         mtbZpzKiPVWlRWe6r25GKAOaKNe2TLsiqPhRkQlK0bLMu5lcTGtU+XQDlrJdtkzY+k7p
         GtNQgmtb2X0dtJm//jGQpSP2gqv3zlTO9mZvyM+GnlrwBNQqVixrMGG0ABYqrSZk1XQy
         LoYqgirnj5qvqWSbpqmUjq173fPsofKO0dOLfAX+3WSIfw6Hd9hz8eg75nLDn4u5/o5o
         OHpw==
X-Forwarded-Encrypted: i=1; AL+hErHd7vzpUAIwbRow6RE/7R8pzxYJmjUYJi9SiJAHrQxQ1/BG8tX/sdfIJ40aR/905LhxFUPd1BNBonI=@lists.linux.dev
X-Gm-Message-State: APuU4Z+gUiTW+4PN+EgUZuULnq2dWdod1IY/oiM8fC1Mn5AAnQXMKdKY
	Q+WP8fF/LGfxcc374QKwKkeSc64oXFwUlqKQ6XWkyTFB2sl2IpCyQ5mdvLUxciMW9erek6JL5rs
	4TcFl2PZ0rLfRUZtBStWMt9CoPu8qHAnm7qPJe2TSFBpKSVLoXOEDqWTgSPXEitLjY7r1iHS8lC
	rXONlG9oqjwfioRImAc9xdc4tTwDbO0xyQ72V3zRUKnv98tH+LUpJ8D+p3xfjAhJX9jIF5doK23
	78JmiA3fcRdRCYly8o=
X-Gm-Gg: AZFdTZfSK4QLY3fxpLtbKdaGi79ruDzolAmO+eqgs8PbvssExC1XP9oS4GYx7KTGsIe
	L2mDW8oEOoL/9ZexSeI7OyZRSRWcBYhjAULbiGmIzZrBlEoUkxdmnvvG/efYYOJlISaCUpKft+q
	HtC+fAtJsVbl1NT895BqoOOMmQtCXzVjN4guZr6rg2ZmDM2almuTBJk40Q61UiuJNk02UC2dBlJ
	fAvUhmvLs1YAugcfuO0QSYis0BjxXvf76fvTM7tNckQq1xfSoi5RBDwC3VdlfVEm2sDwhro+dmR
	yZNA4aS3MebaGD6DfZ0vkZpQxyvVTsDUvC2MRlY/jqhH59IThTUQp4KUqXnivaUvgeyey2HvZs9
	imgVfOaSVbEs4BqXzdfV5hQ2ymQDr8LCg7SUXY9wCxDjlNKaBkZSFYCnQDvIM7kVc1l9a9IDnBt
	Dc/HRH0Snsx0kUxIxO1gW/QYdXJLiyHJyCszwFfARv6Q==
X-Received: by 2002:a17:90b:2cce:b0:3ac:a521:953 with SMTP id 98e67ed59e1d1-3b41c982ee6mr15070898a91.46.1795551239280;
        Tue, 24 Nov 2026 12:13:59 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41d23b49fsm4984758a91.1.2026.11.24.12.13.58
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:13:59 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55d414ff1e9so94865771cf.3
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:13:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551238; x=1796156038; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jp63++EtQIRHNWdJg4YxJkwdYNnnCNo4XlfBjBOr4mc=;
        b=U1H3pj5D3/nj1Vh9Ijf9k994PicZrI9OQUEiwEqXD2ZeA/R/oaS6RPICUNoEcG20TY
         z4Z/zMQb9o7Mj4Q2T0R7lx+zor3H7sIsXJXINy8Qoj2nHppENK3n4hh4rPrzzpDbpFFz
         F1FjoST2v2qihWXH7SQpG93Z0oudRUQiBjmj0=
X-Forwarded-Encrypted: i=1; AL+hErHdJR8FNasYv8Xh9RJAyNricvOEGhhwKeq86jzwdqGk/jL4semgAduTc9ytqBmWk3+mJUeAMTudEYY=@lists.linux.dev
X-Received: by 2002:a05:622a:1909:b0:55c:a104:ebe2 with SMTP id d75a77b69052e-55d7690eeb1mr297462131cf.9.1795551237790;
        Tue, 24 Nov 2026 12:13:57 -0800 (PST)
X-Received: by 2002:a05:622a:1909:b0:55c:a104:ebe2 with SMTP id d75a77b69052e-55d7690eeb1mr297461581cf.9.1795551237281;
        Tue, 24 Nov 2026 12:13:57 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d78812968sm136149711cf.9.2026.11.24.12.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:13:56 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH] wifi: brcmfmac: Fix potential use-after-free on monitor registration failure
Date: Tue, 24 Nov 2026 21:13:54 +0100
Message-ID: <20261124201354.3496134-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261116-c29ba55625-wifi-brcmfmac@mail.sdu.edu.cn>
References: <20261116-c29ba55625-wifi-brcmfmac@mail.sdu.edu.cn>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Mon, 16 Nov 2026 22:13:24 +0800, Guangshuo Li <liguangshuo@mail.sdu.edu.cn> wrote:
> A failed netdevice registration can invoke priv_destructor while
> cfg80211_register_netdevice() still needs the wireless_dev embedded in
> the vif. The caller also frees the vif on this error path.
>
> Install the destructor only after registration succeeds, as done for
> regular interfaces, and leave failed registration cleanup to the caller.
>
> This issue was found by our static analysis tool under development.
> Fixes: 20f2c5fa3af0 ("brcmfmac: add initial support for monitor mode")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
