Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714376;
	b=iTYYZURaT/zF9hMopEW3Y97oMYgAle8shn19PA2QqW2VnRc30KLZVVe5IEl6al78ebkP
	 qrFxFGNkkxtjM6cGfS6IJktQje9euS7BEgANbogDxivvbRRci0/uhSCdVaV1N1nUps3l9
	 7KkYHn7mdsL2RCQ/Vuh+eoOgfDCXN7JpHdMZ8fMCHo/BOnw/o0F8+478n1uhff9rQh9yt
	 obDBct17TgPl9C0r8JyekxgLHmevA0q7r9uIX7MO5V/6Q6L0VsP4d/dglClD86pITJFMs
	 dj/WvXtZ4+j2MY5VwOi6z2o9RcwXABuMtdAyOQQShP+dHvtg/D/EvfBlq9HcD2Aqjsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714376;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=43xLL3WpmNZ/pYhKQm6M7yVVXTs8TfUEc4VM7Zt3f3A=;
	b=xk6aGuIFnYZRYgOGoJq8SoblYr8J4NpJAkc/ssdwgeQvKG1o25IgqijgKvm3lQuMXXAT
	 8/LaaC5+TLDP9GjS0K1j9fW8tOVr/Spw3Yg5P36OQP+DEEjr1tT0ivZq+DMn4AQXwW3a1
	 XUX9kRkt58JtpykTvh52jvP2jiLF9qFbmHA2cDdOimBSicVAbYqNXfkVCWoqAJemse1dX
	 lzgppUMaleKYqS6RDn56SBNJJU8k0lqCe6mSq/jQVtW5hxHwPsTxzOTpf/afkus7XLySL
	 CjTXtyhTlQz0chiSouX6BnCJkFkI75pDjU62iCzRUi0N1nEopj1Eqx+X7gHPMlpgNLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=h0kE53FY;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42B7606A327
	for <brcm80211@lists.linux.dev>; Tue,  3 Nov 2026 13:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B42B7606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=h0kE53FY
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so3283935a91.2
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 05:59:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714375; x=1794319175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=43xLL3WpmNZ/pYhKQm6M7yVVXTs8TfUEc4VM7Zt3f3A=;
        b=J1FHCqazYj5IoyVin2DQjifp3Rl4YaIUtoidrPjCaXXbxKMrl1n310Vef/ZYrBOuta
         eRZGK1cybXL+GWn1b4W5mDLQPrJyXD158lmJ41+Jp5FhuJzs8xuiZao7F3SO7h4j8C/T
         UL7pGxNtK0h4iytH1itXWaYfp71PTPyX15SC0TsvpTRHlY+NMaJVwXKmtovndpSCd5/H
         GW4rP9AQebFXGIuqQAYbJyxZQH2eP1wkuIUjxgaBfMJYvPazbJWodsmGSzWLLTmrpuhp
         mTQVVryFEXq/KyTU+rR1zDzCRoZ93k3xSMh9/LaKck/pelVUVDz8s9u+OFGrSu7Fbika
         98kg==
X-Forwarded-Encrypted: i=1; AKwUvBwTy5TUOT0DAnaab0SqktAR6eKVS0qU3OKscurPwtkHaGlAuDWMa2Rexoo+iV+J98DO9FcmvuM4ZQw=@lists.linux.dev
X-Gm-Message-State: APuU4Z/wvO4txLZyjkLW+p9QdVG3S9YH1FE8IfIHDwuLjRYL0iSzkV1S
	s2YUiH13Y7JzRP34/IUFU6NS9Nt1XjFQqngerdvSOIUyhWwbhRvksYpj3HXyOjkjVRir87QCBRU
	sHPTqWuPU6RLKf9j7mrRbOljdO9sRxQokHc891S3btSXiJkFg4EjIKrKXt/vxuHVBcwyHdWDnCn
	mm1AsOL4hbJd8Daq+iCIjUH+pZakKTuI89SBAln6UiXnfoGKWdRC6k45UaOXcMIS+l++thF/k4M
	9grg7TFc4zRZEKBDi+cZg==
X-Gm-Gg: AYBFou3g+DOlQv1I+hzkjUCqmcNHclOJbYfYPZ4q+2/2iepFNvy8muDbBTv7zR2t1yw
	vuHVYxdAx0zin6hDf0QAEYZZko8t6iqj8kiwyVajylFQSdMCYgHoHt9TMMSPLswRGPndKM4uc3g
	/ONZiTDPqljtiyCMV+FXD0YFlU4rzu3AtYNXmbfOGds05ngN2qcy3pLNb0tCupvbsdTiPFay/Y3
	nTcB+7seKmbyI5N07uUXnSp+Tlj2Wg7jzX3zS3nBGVaqZQ+AdiPq5bCs+FarqV834vkP7/VMnZG
	9UfV696Jh15ghJBzs5VU2Cp1gcLqxz1nid5LQUbDrjlKI66hgjFxn31cIeN3uyEIxUo1x8NaZmP
	9Z49piYmUhnSgqtgx1VrrKbgTbPM5kdmRynB6JfobUEMBpf3nzbthdMMG1OHiEI3XV31Ub/+BVo
	AF7qay4+nglAHnsQlTSvMI1/4i8q+uetdBmtyUIro=
X-Received: by 2002:a17:90b:1845:b0:3a6:e99b:bbdb with SMTP id 98e67ed59e1d1-3ae8984de26mr9150053a91.50.1793714375137;
        Tue, 03 Nov 2026 05:59:35 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b07cab84edsm1845769a91.7.2026.11.03.05.59.34
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:35 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b20a4b5f2bso2139596c88.1
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 05:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714373; x=1794319173; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43xLL3WpmNZ/pYhKQm6M7yVVXTs8TfUEc4VM7Zt3f3A=;
        b=h0kE53FYZ4iVp5XmOke+NABicjOe6QxUX5ClH8L6re4HdhfOkYdR3lqXWvHnVCe87v
         LicMhK9R5Cgni/ePyR0ky/sLngLwO9qR2BobKc+dk3lxeVsLvnwNQzW7AVfz/3wxz6SW
         15s+/mLCu8h3VxK8oiZJq95rXJJVD2oxrGTK0=
X-Forwarded-Encrypted: i=1; AKwUvBxkr4BDREzIjvLxCi2IgwLeVmVzuwln8xMuBG4PfQYYcus8WtqSUXm+LfxCQgiKMbdF0M4ORTD8m04=@lists.linux.dev
X-Received: by 2002:a05:701b:450f:20b0:17d:7b45:f905 with SMTP id a92af1059eb24-1ac5f36ca91mr19014235c88.31.1793714373153;
        Tue, 03 Nov 2026 05:59:33 -0800 (PST)
X-Received: by 2002:a05:701b:450f:20b0:17d:7b45:f905 with SMTP id a92af1059eb24-1ac5f36ca91mr19014203c88.31.1793714372513;
        Tue, 03 Nov 2026 05:59:32 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:31 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Michael Reeves <michael.reeves077@gmail.com>
Cc: Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	"Franky Lin (Zhenhui)" <frankyl@broadcom.com>,
	Mathy Vanhoef <vanhoefm@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	asahi@lists.linux.dev,
	Hector Martin <marcan@marcan.st>,
	Daniel Berlin <dberlin@dberlin.org>,
	Janne Grunau <j@jannau.net>,
	linux-kernel@vger.kernel.org,
	Hante Meuleman <meuleman@broadcom.com>,
	linux-hardening@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH 05/13] wifi: brcmfmac: Negotiate PCIe mailbox transport with firmware
Date: Tue,  3 Nov 2026 14:58:50 +0100
Message-ID: <20261103135856.3676311-7-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-5-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-5-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:40 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Hector Martin <marcan@marcan.st>
>
> Shared protocol version 6 and later allows mailbox messages over the
> control ring as an alternative to the shared-memory mailbox.
>
> Advertise host capabilities using the negotiated shared protocol
> version. Select the control-ring transport when firmware does not set
> BRCMF_PCIE_SHARED_USE_MAILBOX, and dispatch received mailbox data
> through bus operations.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Michael Reeves <michael.reeves077@gmail.com>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../net/wireless/broadcom/brcm80211/brcmfmac/bus.h |  9 +++
>  .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.c  | 57 +++++++++++++++
>  .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.h  |  5 ++
>  .../wireless/broadcom/brcm80211/brcmfmac/pcie.c    | 83 ++++++++++++++++++----
>  4 files changed, 139 insertions(+), 15 deletions(-)
