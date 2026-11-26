Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709699;
	b=kfCi6hZ/opwO+2AWoiHkz3R3qZg0pYCXEqmVdppSgmVWv2r5XThTelfzz3z/8KpQTCCu
	 kwxhyhJJVqeoxY4sBDJk4MIuEb2gqjllbIBhmj2epa1XVPWEozAygb9xuitZxr18L8zP0
	 G5RCtGWb7yuxcPMpy4npzjkHp/q+g6H8dnKOwiawfTOLK+Gekf0rPAKCJSfLn+Zt9R3uI
	 dzcq9ETUY3CblE1iGBTVsnQ1xJJpxTFKROiqEDtedrBMSBtG6z2n4TIqpG8vu2yE/lcRY
	 QY1y/+Xo4glwwsP5Mh2J+Cu8Zaki1GGRxZWu+wRKJf99/DGMbcqx5+vA7oTqIN5INoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709699;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=qbs+BIoxoJt3KJCB4NUMQ6hrQHuhNkcUXUoL68Fd/0w=;
	b=TGTqoUfDbrTInpK6RQija9D4/ccoJTbfagnrcuL8aB7/LWMWSBBXu9UTRtg9vacP9u9t
	 kN3UR/uFct57ANq8jbp/KLpIr45KPmp0V8YU6qR0FuMvdM7cDLp2/NdFFXVTq/e5gRwSX
	 cnILSNtl6eE4rxrvatqDFbXUb6CFFrbdWrWMSl6JUwQIIMkdAZCSjXZWCQDIvB6f60PSH
	 ZdG10AqR+mFoWAfoDFQz63XRJ6tEb5zVddQBXIFGYC3X55sJFbw3yKEXVlnXWSpvJVlA4
	 W1Q04J7D8UW7sAFSbvMY3anUO6l0u0e7iRzxMr/+inE4M8qwkhJwxyqi7JSREGytgaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KmsjOEMF;
	arc=none smtp.remote-ip=209.85.161.98
Received: from mail-oo1-f98.google.com (mail-oo1-f98.google.com [209.85.161.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7112D606A337
	for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 16:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7112D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=KmsjOEMF
Received: by mail-oo1-f98.google.com with SMTP id 006d021491bc7-71af0656bedso4431129eaf.0
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 08:14:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709696; x=1796314496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbs+BIoxoJt3KJCB4NUMQ6hrQHuhNkcUXUoL68Fd/0w=;
        b=PnaHIkgSBFWzgjaKdfm4SmMZODE4xASfLJDHJqv2K6ynogXYa7tS/skdGYpfS/dOjO
         RfLQHsOp98LN6S0duPkpqEH//bKkYtzHDk6hbN2qvTheiI5aAFXAUEdf/r+JK7WUidP6
         DtjVHQ976f1QEAIYjKKgqfL9GJeOcsZruL8mgZkaMlejrMK8tk0BXfb/0YWRSLZ3ILMs
         64nHHh/3SDjz9JYajcFtyIOGWJMyzcqhpnxmVLN2PV//VB0PQpJxCkOVtfiVtmZRUUTR
         HoRDnAgYBrdY9EwE2MRHy5t/0pp63h4/G/Co7q0lHzsXG4vb9UT01qv7FdTMEdJuww9d
         YzXw==
X-Forwarded-Encrypted: i=1; AL+hErF7LZ/oP8HJXrkhvRRLzSK3MEGzyLNUW+PhHWdvCFkWYVbKiAy1egS74aKTZ5SckzOP495JMAGFRyg=@lists.linux.dev
X-Gm-Message-State: APuU4Z/x8o12i7cWuT3zkEX++xGGZWhzaDxXBbdALiJg/OVrvhYxJvq1
	yGAfyqwQE5XpdZdU/TS9muYsnBx/czSbMvZm+SQXB/xIeyIPMlPpTjM36/EBKwL0qfms3wVdZtn
	6IfiT8622RPMcBMETU2JIzwm9atod7ZA7ePqcRsTLNXp+DHBjVyFwqVoGJWjXQFvA/DS/YHEztP
	UFJv6Hmszx9FJS8xV80dF120VYGOm7Q1+Zanv3daTu/tDagCZR+teqCWFxA3mRfvs2XgNBmPEZ2
	D7cBIHcw+2iMUBLUMF2jw==
X-Gm-Gg: AZFdTZeRqrMGsuwFWUifH9m7AjMwD7pWRnTabWU+2LSd/oXeRiCx92EaEq+UPq+KlS4
	4JLd9srpg3mLYyNx+T9Wz4yy7XjyPmEL4d0/p/1A91hyg95TANjMjmHZVBoukqSe18bvYKpvFTp
	FiFiQd5YqfeCgK7xsYv0fCxpd3BFSGRTX4frlMWwj5yqY1cm14ZZKFtSXL6UAnvso+zPIeSRoa6
	6HrvnAzma15w/JWAgHq2W6Z1+YkLlt3OrRFowd7QkLdDuTIjDPWloxohA73NLA+HIiyifnMdO2f
	sa3bDVcwvqJqun29h903Pi1ZwTfZ4pDtgfLrHyIQCOvD1Yi/+bSCom1VTYfJjY9VwwybKzEqI+Q
	K8tSO7QPVxbF7Ans6eVnvZomamsg1BGae6Tv8O1bJAIVvB1xsWKZ8KVm6OVesXjMGWldr44FyRb
	6l26H102krSx3ZmsCqh488CBryT0HBhjm3DILk5eKz0A==
X-Received: by 2002:a05:6820:625:b0:71b:7fd0:cb0a with SMTP id 006d021491bc7-71b7fd0db80mr4380092eaf.58.1795709696364;
        Thu, 26 Nov 2026 08:14:56 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-8631691c4a5sm167669a34.20.2026.11.26.08.14.56
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:14:56 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949b0d322fcso1196184285a.2
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 08:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795709695; x=1796314495; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qbs+BIoxoJt3KJCB4NUMQ6hrQHuhNkcUXUoL68Fd/0w=;
        b=KmsjOEMFsUSRS8WVoQ4s7F560i3/sDOvj13FIEpVolYGo+X2FGvmEJI2fwQQKannHn
         cNmkKW9YXA4OiFP5ZYsES/aWrUcaLWMTPrvTvDAljZs9lqG7klzxJJ5VFtZtXwv8pkmu
         An9z8jJiI/WO2DZ9Bp+xkxcqjFCovnxZ3aMHg=
X-Forwarded-Encrypted: i=1; AL+hErF8+RcjG0xRtAkxOoD8VcxPXgFh5jM6tMDDfA33IKfFCaBFYg0OkA9lfeoKp1S/3OSPqH70Cv8IggE=@lists.linux.dev
X-Received: by 2002:a05:620a:468d:b0:93e:d051:8f19 with SMTP id af79cd13be357-949ba9b3950mr3803210485a.40.1795709695415;
        Thu, 26 Nov 2026 08:14:55 -0800 (PST)
X-Received: by 2002:a05:620a:468d:b0:93e:d051:8f19 with SMTP id af79cd13be357-949ba9b3950mr3803205785a.40.1795709694974;
        Thu, 26 Nov 2026 08:14:54 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949ca6a0693sm1377617285a.20.2026.11.26.08.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:14:54 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Sasha Finkelstein <k@chaosmail.tech>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Aditya Garg <aditya.garg@linux.dev>,
	Yossef Osman <Yossef.Osman@proton.me>
Subject: Re: [PATCH wireless-next v2 6/6] wifi: brcmfmac: pass AWDL frames and role changes to user space
Date: Thu, 26 Nov 2026 17:14:42 +0100
Message-ID: <20261126161444.2484980-4-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261125190254.176055-7-dev@deq.rocks>
References: <20261125190254.176055-7-dev@deq.rocks>
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

On Wed, 25 Nov 2026 20:02:54 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> User space runs the AWDL election and peer discovery from the AWDL
> action frames of other devices. The firmware reports them on the AWDL
> interface with ACTION_FRAME_RX and AWDL_EVENT, behind a header of
> version 1 (16 bytes) or 2 (24 bytes), and its AWDL role with AWDL_ROLE.
>
> AWDL_AW, AWDL_ROLE, AWDL_EVENT, AWDL_STATS and SDB_STATE are event codes
> of the Apple firmware. Add them as abstract event codes, mapped and
> registered by the WCC vendor module like the CYW module does for its
> events.
>
> Pass the AWDL action frames and role changes to user space as the
> vendor events AWDL_FRAME and AWDL_ROLE.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/awdl.c        | 110 +++++++++++++++++-
>  .../broadcom/brcm80211/brcmfmac/awdl.h        |   3 +
>  .../broadcom/brcm80211/brcmfmac/fweh.c        |   8 +-
>  .../broadcom/brcm80211/brcmfmac/fweh.h        |   7 +-
>  .../broadcom/brcm80211/brcmfmac/vendor.c      |   8 ++
>  .../broadcom/brcm80211/brcmfmac/vendor.h      |  12 ++
>  .../broadcom/brcm80211/brcmfmac/wcc/core.c    |  39 +++++++
>  7 files changed, 177 insertions(+), 10 deletions(-)

You may add my acknowledgement in v3.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
