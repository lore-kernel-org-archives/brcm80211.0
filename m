Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714399;
	b=Vz3EN2qPpIvN9g4760EneUuU+dVs1cy/YSdzM4grqIU3oxyhwbSiEUFcK3pAumh3mGKG
	 AtAbCAQNimbbDr/C6Gx5vDMIgrTGz5SM8TfrgbdYa0TEPYFswMei3OC4vDF94tZ7uGNTY
	 bGbtfyf6vEvwh1iALnD5zjQKiPxxvqNLnVcj8p51w3P4LlL7uEbyreR28V5AI9wJ3Mzez
	 3ZBqJdVVQLJCXxg8YqLYgs9KvAqRjm/uXEbCHcU6cq/tjiwAxcya3Mr3FcWmDHzIPbHWD
	 LPlxSHvYYJzKvA9TyCcu27CrJfJnLmrmYNDlkN2b00j0uv6nbG1w5TA07fnlkFhPLPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714399;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=xnAMlverv3/IjELyJ32hRjwWOMBKoAty6kX1tfLCe1g=;
	b=WTOStSyBi0qHtBPXZ7XWpgkFk6cI+K3hnz38dDGetLaY7tDuk2yCr7itjy7CoKVSY6MS
	 2h2EFIu+sdUxytUCLwFBHKEMZgJUJnvlzQVa/wxLQjefqEVrpLwukpKeI5j2lhNuX4Wbj
	 cuiKOec8mpMWzFMgnTxqZUqkL2NpIB8fchlyJN6kfooJd0YJLDs88+P2suU6Dn2Lce1Jv
	 GNr+7iZAvRRjzfuajQNpEwOMlLYvftZbsMtDpKa7yArrtOPJ9v8NCGCOqo62RhPd6wvoW
	 BIxwnuyXKU1e6wmEvzW9FnRUq7QbaOH0it6HDygX0imZHmS6H1UcewxN5RIippgiLKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XSqCvZZY;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527D96085087
	for <brcm80211@lists.linux.dev>; Tue,  3 Nov 2026 13:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 527D96085087
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=XSqCvZZY
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3ae1b34e0d2so388495a91.1
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 05:59:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714399; x=1794319199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnAMlverv3/IjELyJ32hRjwWOMBKoAty6kX1tfLCe1g=;
        b=NqIpvdVDMvAFlEgAy+iQ0ytPRFbMvIX4thgF2tg6nM1iryBHEq0XkfRLBiqmC4xzfr
         LTh+2J4mlOLlHsIvzW30QgproPsafoFWn3A1h/JCRiFsOwTQr/tngqMvGRkoxsAe3Wbf
         N74vb3Zm1QMq3z5GGe3Ix1NoROoaS5xxieUuwM3sC/lj8xPL9dGcskIolnZB+pkgGF4Q
         blXQ26k467Z/q5FE/Jd7cQ49cMg4/miqf/Y53h49FxmXi8PQU8FAlArhAMiwhwfNSrz8
         wShyPjF5CIDSSgyA+ErT5359UdKbTmIXTLevW7B1k0vRh4Ds5aOXOqbun/fkQ9FrEeg2
         n/mA==
X-Forwarded-Encrypted: i=1; AKwUvBzTJjaXUOeYYgga+HUv19Y3s36apMjKIrpnDb8AyWl4rkYG7epG/n7pKx0GrA0wVHiORqQ0GVYZ2ew=@lists.linux.dev
X-Gm-Message-State: APuU4Z/pOhGgLzqpBReHXGNWA1fvMK/1anv0wbEJz6UeOawVcIp53hCS
	IUtO6O1d1QEfZJkEZxrY47VAUJ082rNtM7VNx099VseBj9uXVRCE372ASuLSISW1MphSXfsZPHA
	OM/PF12BtgRArlcV6IDK5v4qttb+I0ngNkDvOR1v8MyCNHCpz0AixkK91G7+XwTi3l1CcrCGYEd
	PRVX3LOuyv/rxy2+K2xZC3K9fDt5T6pQEDv3IKpB3NhvXi3g7hqXUSVcC5cVspiHCjb+N62C64u
	mykXQCv0dQX1Bgkl+tqOQ==
X-Gm-Gg: AYBFou2JXY2IvJfyyJzE2eyi3pCzIysBPqzt8fgiIyxwuHtMnSiJcSp9kB1BUFLpkYR
	FTbT95vW/WBkq/nJLR2PxhagHApz5UEIusu6i4kdvn1I4rtVf5tUlqd281hRf76WYd4IxtFvfuN
	JTmQaE3Nk2To3H6xzEMo0nQMt5p0ITZ/eM18kX5JfRK5Ewuo534dMdbr7P5mo3woB8SfNv7GJAH
	8By8GVpXRdappDlRXcIV59sTOR99SWFGQZnEtveWRuWcyjzg3yt3pkM4DTFJvBKaQslVWMLWNj4
	l0VGweQDN5PkoJm57H/uC0M81XGi/TSYIHMnkFuVgyAroOAwI6QrIJFDPJvSH/UA4GL4ensS/Be
	MxKVj6VzZb2PaXxG4QgVr/7TJ3Yha3M9N984xMCHqr7KMwNCpIMSCqlzQaKgV4Ad83TtxYr9ovB
	Hpe0S/W0KMuQdLgSK9aC1J2NZTYlH117G+vCF+FK0=
X-Received: by 2002:a17:90b:5848:b0:3a6:d850:bf16 with SMTP id 98e67ed59e1d1-3ae8974a413mr6643370a91.23.1793714398516;
        Tue, 03 Nov 2026 05:59:58 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b08e8418easm316432a91.1.2026.11.03.05.59.58
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:58 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1ab289bb41eso474919c88.1
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 05:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714397; x=1794319197; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnAMlverv3/IjELyJ32hRjwWOMBKoAty6kX1tfLCe1g=;
        b=XSqCvZZYy6UCqM7cPZ7tLuBHdqVInJI7ewB7yVbNHYzUz4RTxqn1pKzrzWVApY1tw9
         IDBXXCRijtytFpzoe8vDSw0irjfztYKKAsNrnKHZH/5jJ4/dTBYJVJpteZzox7wwVZDw
         W4d0i3onwThJQ37W+uTIAMCXi6TUAcTCLaTxI=
X-Forwarded-Encrypted: i=1; AKwUvBwdNry/DTFFtsaal47DlXxD54zhBOCbp+9Rd/vUzVW7YwRAdZ7jlG7yvTZuWRbnu80QJR5LX+z7Nek=@lists.linux.dev
X-Received: by 2002:a05:701b:271b:b0:148:ece:8cc3 with SMTP id a92af1059eb24-1a94adc93b7mr20492422c88.24.1793714396658;
        Tue, 03 Nov 2026 05:59:56 -0800 (PST)
X-Received: by 2002:a05:701b:271b:b0:148:ece:8cc3 with SMTP id a92af1059eb24-1a94adc93b7mr20492387c88.24.1793714395934;
        Tue, 03 Nov 2026 05:59:55 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:55 -0800 (PST)
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
Subject: Re: [PATCH 11/13] wifi: brcmfmac: Support versioned join requests
Date: Tue,  3 Nov 2026 14:58:55 +0100
Message-ID: <20261103135856.3676311-12-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-11-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-11-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:46 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Hector Martin <marcan@marcan.st>
>
> Newer firmware uses version 1 join and association structures with
> explicit version headers.
>
> Query join_ver and build version 1 requests when required. Retain legacy
> layouts for older firmware and fall back to BRCMF_C_SET_SSID when the
> join iovar returns -EBADE. Use the selected association layout for IBSS
> joins too. Report unsupported join versions rather than guessing their
> request layout.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Daniel Berlin <dberlin@dberlin.org>
> Co-developed-by: Michael Reeves <michael.reeves077@gmail.com>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 73 +++++++++++++++++++---
>  .../wireless/broadcom/brcm80211/brcmfmac/core.h    |  1 +
>  .../wireless/broadcom/brcm80211/brcmfmac/feature.c | 19 ++++++
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h       | 29 +++++++++
>  4 files changed, 113 insertions(+), 9 deletions(-)
