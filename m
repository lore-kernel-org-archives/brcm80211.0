Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75911547F5
	for <brcm80211@lists.linux.dev>; Sat, 19 Apr 2025 06:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745045190; cv=none; b=Xs5lKhfaLEkny+kPkz3ihnrZodXi6Tb7hwJ2wcLKiRO/lTQxQa1L0QqatEkw70C/6440mhUSuT79FpQzaUbGgK0VyKL5HnQtToJsDwsathdrjNVvasKzX+dEvXtezqtmG6FmiSNL02rpLhvFdpDAH3GNNk9s3nirm5tlC/5xCzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745045190; c=relaxed/simple;
	bh=iDl5B1v5FJYHXZlOgXY0HpWkdqy9oyaPAFwJEp09aoY=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=K0JUdou5t0Yb6jORFvHr/bEG8lmypYLoYXIB3X+aHYhgJ77PEznPuLyn1WdCG1PmM2KgHBske1nltplhG8gldkXFWhPacrUxzhFGLXRhUyi90QGgUCXHaIvUqco6w9ukZt8JuyVrYtse1E09eCqhluSSr9pkxtnY/rwLxf+L3q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=byOUXHLx; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="byOUXHLx"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-72c47631b4cso1620192a34.1
        for <brcm80211@lists.linux.dev>; Fri, 18 Apr 2025 23:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745045188; x=1745649988; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AgGfe7pfQEKHXwAsiL/+C2u2L63eEHqUtK4c7n9+Ets=;
        b=byOUXHLxPm3DLW1CUs6hP+KzF3VphpCtxZth7c1+gBjNDdIUlpaRE3XQBTu7c/c2Em
         1lUqU9Pk5xLziuYj7XC6tzm8dmFHdOXrGCAboC3L5yM2iHLf6fcgGW4YpeVM52UtAzDO
         E+ojBFe4Qnu3ac22y1m6DCcldyYo9zU+mwH0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745045188; x=1745649988;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AgGfe7pfQEKHXwAsiL/+C2u2L63eEHqUtK4c7n9+Ets=;
        b=ACHGQ08ydp3pNpsvxweS0AuBCgj/o+hgIYwNpP9Rm1s1u+KQNYr6t8SV1yZ/OPaJLE
         ln76cTEDy3DGLcww4tBClfjsSDH1kyCNY9lJ0nEagf9Jds8BS26VMqTQTPRaT+1m0CLq
         Lf1Hkx1o9++dlKkfjxylVgD8lFE2X4d3Uy+6uzilv3o/Io6dnvo/kNQnRE76GV02On2O
         5AUEH3grZdr5PX6c9lF7MRqS0rRH4pPJf1xIMjRNx7lLnOf68fR1DymN60mF4b7SPVr+
         qvaEzliLYOF4Z6IqRVDJtiokNRj7jGS/l197Xk55HDZeoV2QqqeuUh/tuVPjowtrg3V3
         hERA==
X-Forwarded-Encrypted: i=1; AJvYcCWa/CO+o2KUJn8mbMj1Gn5SPN3gktUi0ljeK5gATAvzPAp01aMmIQ5vi9jrOhQyQtWeENztpQijO/w=@lists.linux.dev
X-Gm-Message-State: AOJu0YxuWx/wAxH8Jt5BGjYAnHTET1GO1umUVSGE1FQ/EqvG+/bxGADN
	pnhfuL4K7zXlElFIJSXo7j5P0MmMKaj/dASRTP5ytVw+v+X9fhg3k/uVIzvfYstse5tz5PTkJO+
	dgw==
X-Gm-Gg: ASbGncu6FRC0QTMp7eqePjqiIxl3w7VXmJ6ImCmdEpkq7a0S8S3PdV5CT22jjO57pla
	fEpVNEvU9dJxvpoZ93xHyPadX+lzYHOwwkTTUefZxsm0sRsa6fw/5mcYXc9Z9i5+qKnpj0cayBq
	/wCtKA2nTdJLML7Qyl1srL0UJT8MWyQXPwgA1GY/mDN3n95+MJzZJymrJmTwdNLvmN9q8DhQXvk
	VH6p/y79SCw7zbwwAxu6nhK6DtqbRxj8goGkjHVa8UTLfbaKUVtQP85vKKzY0W6ywgYYZRT5/B2
	CtLRYRQcE3Ztq8eNe4fCV6DGGru5ns9j9DIm78xpnfiZOom1FVhILIURm+xc7jpu7fQmSIYrikj
	RhWA=
X-Google-Smtp-Source: AGHT+IEGUlFLW66ijvjDAdwIEjVLrDZHsPSRPo1a//tFPGyZK0o6IG8RL1FLXXN9Ju9SX94gEV6kLg==
X-Received: by 2002:a05:6830:6687:b0:72a:1d2a:4acf with SMTP id 46e09a7af769-730062fbcc4mr2693431a34.17.1745045187657;
        Fri, 18 Apr 2025 23:46:27 -0700 (PDT)
Received: from [192.168.178.39] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7300478ed86sm621952a34.11.2025.04.18.23.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 23:46:26 -0700 (PDT)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: Wentao Liang <vulab@iscas.ac.cn>, <kvalo@kernel.org>
CC: <linux-wireless@vger.kernel.org>, <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>
Date: Sat, 19 Apr 2025 08:46:20 +0200
Message-ID: <1964ccc4e60.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20250415122001.3325-1-vulab@iscas.ac.cn>
References: <20250415122001.3325-1-vulab@iscas.ac.cn>
User-Agent: AquaMail/1.54.1 (build: 105401536)
Subject: Re: [PATCH v4] brcm80211: fmac: Add error log in brcmf_usb_dl_cmd()
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit

On April 15, 2025 2:21:37 PM Wentao Liang <vulab@iscas.ac.cn> wrote:

> In brcmf_usb_dl_cmd(), the error logging is not enough to describe
> the error state. And some caller of the brcmf_usb_dl_cmd() does not
> handle its error. An error log in brcmf_usb_dl_cmd() is needed to
> prevent silent failure.
>
> Add error handling in brcmf_usb_dl_cmd() to log the command id and
> error code in the brcmf_usb_dl_cmd() fails. In this way, every
> invocation of the function logs a message upon failure.
>
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
> v4: Fix spelling problem.
> v3: Change patch name and comment. Move error log into brcmf_usb_dl_cmd().
> v2: Remove redundant bailing out code.
>
> .../wireless/broadcom/brcm80211/brcmfmac/usb.c   | 16 ++++++++++++----
> 1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c 
> b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
> index d06c724f63d9..a11a6d9f3c2b 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
> @@ -744,12 +744,16 @@ static int brcmf_usb_dl_cmd(struct brcmf_usbdev_info 
> *devinfo, u8 cmd,
> char *tmpbuf;
> u16 size;
>
> - if ((!devinfo) || (devinfo->ctl_urb == NULL))
> - return -EINVAL;
> + if (!devinfo || !devinfo->ctl_urb) {
> + ret = -EINVAL;
> + goto err;
> + }
>
> tmpbuf = kmalloc(buflen, GFP_ATOMIC);
> - if (!tmpbuf)
> - return -ENOMEM;
> + if (!tmpbuf) {
> + ret = -ENOMEM;
> + goto err;
> + }
>
> size = buflen;
> devinfo->ctl_urb->transfer_buffer_length = size;
> @@ -783,6 +787,10 @@ static int brcmf_usb_dl_cmd(struct brcmf_usbdev_info 
> *devinfo, u8 cmd,
> finalize:

The finalize label is used for failure path as well. So I suggest to get 
rid of it requiring modified patch like:

- finalize:
        kfree(tmpbuf);
-       return ret;
+.     return 0;
+
+ err:

+      brcmf_err("dl cmd %u failed: err=%d\n", cmd, ret);
+      kfree(tmpbuf);
+      return ret;
}

Obviously this means tmpbuf should be NULL initialized.

Regards,
Arend


