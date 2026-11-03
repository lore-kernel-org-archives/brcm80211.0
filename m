Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714380;
	b=1HiUNBFbCedcATxJge/vWvo8EQwIw8oGqgrgk7RS6jjJ1LP99/UQjQrBn5FNij4Rsj27
	 uhBh+iKyTObGZqkwt6r1MV9eM/Z3ZONoBrhq2O3LUxx66hKt9apuztulYztIEMnfgUaG9
	 eoKMDJuyi1u5Maj1syIzw7zfhB3Pqqefp473Zldlk1R+YdNxzmQ9f06hLOy13mJjn2wua
	 kikHAv3Xvar+so5tJf0Zd6QwyNx3sHtWhWcNKQdYSRUx94JtNrttvBjqZHaWIPw1M7UwB
	 0wu7mN634WDP5ZS6u+yWE8O9WmyNQikuJ+zSCHL15d5YNO4hvI/ABOUZX1sgbSgpnIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714380;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=MKbHGKv5YTUZyLi0eTwdWhkz8iHCBkMeD/Uh/c0x5O8=;
	b=T78c75FjM4ZlaG+LdIEVAua1LVCXj5z/CbjIzjTDB7M0BLqDO+ZS8xyppbIgOaDD5DsY
	 VULujxM5SiiBcgBT+D4osQULRi6RBYVIVnqGQg3zhWkF8bybP36mH051URzkVTfDR9z3L
	 1zQDB3JriDufIO/vQhHB/pvFZgjOf6NLftbwcVnx0sPnMklfMcGmU6gEu9xaTZRRfhtTr
	 h616B1lXezZE72+1uwCKVOcVjhV4sVoyA/lFtKkNS2jajw9tiwTWefdpOmkHNB9AnpcGM
	 i/UOP1NG3q/STVYlnIdyz/XqDqr548TBaquYXkCP3SV5wyzJroQ5J4/c1V7SgeWUhFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="HI/b1qPu";
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 330986082BD5
	for <brcm80211@lists.linux.dev>; Tue,  3 Nov 2026 13:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 330986082BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=HI/b1qPu
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cc502d509c0so1704550a12.2
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 05:59:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714379; x=1794319179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKbHGKv5YTUZyLi0eTwdWhkz8iHCBkMeD/Uh/c0x5O8=;
        b=RXeOhwJ6vwQJRfUYteD5Zh3eWwB7PaolNDwKuE8ypb+lxKitPba5j/7zQmi45SG+Qq
         jFZYniVu1JrD0L6SanoAPiLXTrNK7cHHVD7seEuT+XP+xHXCVAhHJoFjmK3QG0PHQvz9
         FcPupFKroHStZ4G+z0PKOrfMn4Cy0VKwrHrGo1ya194ksS4+uK7ttQyF9va4M4MmvDu9
         v1GMOzL2QTydgjYv+pHV6jri7kZ+4Mp9Jsmg0nnZtY3U4Lf58dRgYsCLYJT5KNKNXqWn
         rE6YgtmkG9DsIbj2Yzv941uTREg8WJf+0kF6paUPkgYBU5sab+NonKNN8Epvx0x5COuC
         r2PQ==
X-Forwarded-Encrypted: i=1; AKwUvBwF9CHRSSsq4L8oryxBazb89lj07KiWqs1sG28JprdZP/od681zqtswsrL6cNJyEeiYadC5Mkb7M+M=@lists.linux.dev
X-Gm-Message-State: APuU4Z/1j7gNwkVBLQEHWy1JqZT/2BG3W40npV+QptOGA593lhc3OGvY
	H60E4aDzJTmt3ojpB4drKYj+A3+fRIHHuwA+Fjg4iz87dqlvQfj0QG8haFOsO4bsXaSUSs/GPLz
	sHSPLe75HN7qtMtsDKk+BlPPXnYB4163ZS50lDEwHGvWsP0yWwLSu1yGDrB/8wozL+T6iZ7z5zB
	P9TLtm5KsBP/9SoFAXLcYQ1ZgpP4nRQ0Wq+QJ3ig9VTl/Z1aeoEgbghYaTRsAgjrgbhRVNgRaI4
	IyiTeTktNhH22gf5mjyUw==
X-Gm-Gg: AYBFou2jScRaWFXMNpLPgEz5nCW39WQq8MBc9DDgqeWzjsr6nLhKQf6Qxobmgs2xFpd
	suUkuCn52mK7cCKiMek7dBMP0M9dAhnNDmcAS/251TJMR/p4q5qromLz5jewcO/WhhR2oK7glVL
	xROTQDNK7BxawiFte3KgvYQsDLlHxIy9BuN5S2TiH49AaKH5W1GPoVRJTu8QHpLmSzYPJH9/9aV
	jlOAmNq4p158JHMZVAuIfWLVaV2sc/qoYL7S++Q7DOSxO6kq3gh05h5p0eTtSXvhyUCra9S9JbY
	zjai2bKQR2A5Ujpyb1rg7+DpmQ6oabE+7UPtI8EYHl7GRh98lHAfa4X5Fp02R3h76HDYFaa+Y4Y
	LQtv8JbZg+oELvpCGcVd7cniHCl2zfNFsJjZ5CJ1i8FmajGVsCl8KWr1gopWc2zbAEvFCQz9fWz
	ikJB5qvokoHUViyJN7MefY0B/9IiP9enhx56FrSgM=
X-Received: by 2002:a17:90b:3c8c:b0:3ad:68f7:dbcd with SMTP id 98e67ed59e1d1-3ae8983c68cmr11074065a91.55.1793714379400;
        Tue, 03 Nov 2026 05:59:39 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b07ca31151sm1882713a91.6.2026.11.03.05.59.38
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:39 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1acbaf81bebso894099c88.1
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 05:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714377; x=1794319177; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKbHGKv5YTUZyLi0eTwdWhkz8iHCBkMeD/Uh/c0x5O8=;
        b=HI/b1qPujPrtFBMaZ6TaPlfUENgx2EUy3DgPvvxYySqd/pUCE9pRXnElprQFdyol4J
         l/MLocI9XuU2imD7lpzjk9rNrRygtTbrfFHT4MUbsMkmqNri6EsE143SH+BeHVMqemka
         foj8e99F85/9Z8gCUp/NsH81UEzCfD+lL4Jic=
X-Forwarded-Encrypted: i=1; AKwUvBy/w70Uu3ZeeDcIFIuz298DEDlBIDNkO3sjVtOz/MGZECwJBVkoOTdyCi71WNkoduNMSfDITSewxmc=@lists.linux.dev
X-Received: by 2002:a05:7022:2581:b0:1a8:7b58:6f1b with SMTP id a92af1059eb24-1ac5cfe587cmr24855352c88.19.1793714377501;
        Tue, 03 Nov 2026 05:59:37 -0800 (PST)
X-Received: by 2002:a05:7022:2581:b0:1a8:7b58:6f1b with SMTP id a92af1059eb24-1ac5cfe587cmr24855289c88.19.1793714376827;
        Tue, 03 Nov 2026 05:59:36 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:36 -0800 (PST)
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
Subject: Re: [PATCH 10/13] wifi: brcmfmac: Support versioned scan parameter layouts
Date: Tue,  3 Nov 2026 14:58:51 +0100
Message-ID: <20261103135856.3676311-8-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-10-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-10-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:45 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Daniel Berlin <dberlin@dberlin.org>
>
> Newer firmware uses scan parameter layouts with version headers, wider
> scan flags, and additional fields. Requests must match the layout
> expected by firmware.
>
> Select builders for versions 1 through 4 from the scan_ver response and
> use the selected layout for both scan requests and aborts. Fall back to
> version 1 when version discovery is unavailable.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Daniel Berlin <dberlin@dberlin.org>
> Co-developed-by: Hector Martin <marcan@marcan.st>
> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Michael Reeves <michael.reeves077@gmail.com>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/Makefile  |   1 +
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c         | 203 ++--------
>  .../wireless/broadcom/brcm80211/brcmfmac/core.h    |  17 +
>  .../wireless/broadcom/brcm80211/brcmfmac/feature.c |  46 ++-
>  .../broadcom/brcm80211/brcmfmac/fwil_types.h       |  65 ++++
>  .../broadcom/brcm80211/brcmfmac/scan_param.c       | 416 +++++++++++++++++++++
>  .../broadcom/brcm80211/brcmfmac/scan_param.h       |  13 +
>  7 files changed, 594 insertions(+), 167 deletions(-)
