Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86C91E531
	for <brcm80211@lists.linux.dev>; Tue,  2 Jul 2024 14:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719928960; cv=none; b=mIvQmBwKceFupSihddacoLbeKQvYzZgw18YKjLAOX5MI3Nf07T8URCrsQJByq+JEvXghK62LdI4edmNXCB0KXBjwxeB8uLpZJvEyaRJK4WRyeiqw+FtnzZXJL3SowjprCl6h770FePQ9lX7KoBHjqlDU/H9gZ8fojMVI7T9Ena0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719928960; c=relaxed/simple;
	bh=rvLq1+m8vg5sjoU1mr41s2ejjDcYQZEP8b81SL/Ncv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P2ef0tjIdvY8iCUrSbVs1alRnCktXUBfUmci6ZCWKCH8pEZJj8Qh54oumWctbHZzbhaAEGSmZ002ZQOO9CwCK2NHFIDKCh14niaNitWfX2q5YTUWxDjQgbQrbzbGPERLlFV6F+oTaf37TTnotHsu+zYvyTRJ/2nXnMIagUNokv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k90XiXl8; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k90XiXl8"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2c901185d73so3758095a91.0
        for <brcm80211@lists.linux.dev>; Tue, 02 Jul 2024 07:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719928958; x=1720533758; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UHRR9paF0c3vAEmjr04Xd/MVPuaCgs2m6+t9yEgF4PI=;
        b=k90XiXl80Q28Rmouci8Umf0DeZPEIYfZxH7vy7qzOYy5BVb/fEImy9o9HYrTxLkRY9
         ZaRU36qnxcXTsiqdStYSSt8TcbL3K08+AWvhIpxjy/3s/Objrz1h13lKNsMMlqFDgMu9
         LXACEEpcad0tlDvruMgOBlLZ7H33cOMN6Hh9i7XVAuELq3FlCByz9868eEWx2v6IW7Ih
         yiSRblixCWbkFBuQx8VFEXHDX0KYyC2HPGuTB1SJ5S6RiUKOYJOg7SwUg1IOVKzJ9gha
         tazKorvbEdq4LaOyz7BjCINckR38qUXxxyLiNTOf62wX1trgnRDHUOZfM7FebO2/kkVw
         RaSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719928958; x=1720533758;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UHRR9paF0c3vAEmjr04Xd/MVPuaCgs2m6+t9yEgF4PI=;
        b=fuG9RTbe6ZdlRrjJ7dzQ/zzFPYX7plSsh4FQpfRLh1eVdkEMrBYTOpA8/QLPcb5t6+
         blpxIiYUyy6eiYvoW00snPGm2zUK2gsrRer7xjBXhngI168L+hA+7b6Asq+gWJ7PcsHF
         GCzAt6OC7+R9teuq7j3/2m/7AhcKg0T/5ZnI/nYX6N5o+UQ7Q3QYsiIeUcobY7hn4hFj
         kl54b48HbY2iaDdNQR5pDEx6tojLCC7KXB/g61Ei83PLCpaTf6OBAr/RVSxCQ6+ja7wH
         aPZTLHnGNTSVkZYo2811DAbfndvQbxbobUogS75Z8FlKLn4BYdBoTcLxch8vAoF04GzW
         LIHg==
X-Forwarded-Encrypted: i=1; AJvYcCV9R9vxXhH9HmTnxyCA9IuTqBstpDil+lGxZyGss7ePYYF7Ys68MNT9AZBL7Jns5/iLzTwIiYKqu/TYOgPth5VYCEFDs9rx3Ffo
X-Gm-Message-State: AOJu0YyTyNFxc1vimP+FDR9RwAoay9m5zQuxx3mW2yjvnIR4RYW9pUwo
	ko6ujNonXFqPk8myweKixDHtOPgrg45B1CPIfMc+ffL4k3SmmWDS+vn4YV2YgdqW12wThjiR3SM
	YovhMycW7q25dLaawO2yi2BXTDEA=
X-Google-Smtp-Source: AGHT+IGr1IVhpma/X7cSGsV5+8epSN8AW4SxOgaesf6/u7RkxgP+qDb+mA8xG/CFotsUpvIlfd9npkCfvELtxOAGNQo=
X-Received: by 2002:a17:90b:3543:b0:2c9:6abd:ca64 with SMTP id
 98e67ed59e1d1-2c96abdcad1mr769838a91.9.1719928957854; Tue, 02 Jul 2024
 07:02:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240702122450.2213833-1-suhui@nfschina.com>
In-Reply-To: <20240702122450.2213833-1-suhui@nfschina.com>
From: Jonas Gorski <jonas.gorski@gmail.com>
Date: Tue, 2 Jul 2024 16:02:25 +0200
Message-ID: <CAOiHx=n5rfCBkO8wfqpa=UgL==Ty9=s1f=roVHiaFy2acQOHtw@mail.gmail.com>
Subject: Re: [PATCH wireless 0/9] wifi: cfg80211: avoid some garbage values
To: Su Hui <suhui@nfschina.com>
Cc: arend.vanspriel@broadcom.com, kvalo@kernel.org, johannes.berg@intel.com, 
	kees@kernel.org, a@bayrepo.ru, quic_alokad@quicinc.com, zyytlz.wz@163.com, 
	marcan@marcan.st, petr.tesarik.ext@huawei.com, duoming@zju.edu.cn, 
	colin.i.king@gmail.com, u.kleine-koenig@pengutronix.de, 
	quic_jjohnson@quicinc.com, linville@tuxdriver.com, pieterpg@broadcom.com, 
	meuleman@broadcom.com, frankyl@broadcom.com, stanley.hsu@cypress.com, 
	wright.feng@cypress.com, ian.lin@infineon.com, chi-hsien.lin@cypress.com, 
	zajec5@gmail.com, antonio@open-mesh.com, franky.lin@broadcom.com, 
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, 
	brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

On Tue, 2 Jul 2024 at 14:50, Su Hui <suhui@nfschina.com> wrote:
>
> Clang static checker (scan-build) has some warnings as follows.
>
> included from drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c:16
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil.h:123:2:
> warning:Assigned value is garbage or undefined [core.uninitialized.Assign]
>   123 |         __le32 data_le = cpu_to_le32(*data);
>       |         ^~~~~~~~~~~~~~   ~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c:138:3:warning
> Value stored to 'err' is never read [deadcode.DeadStores]
>
> There are some functions like brcmf_fil_{cmd,iovar,basscfg}_int_get()
> which read the value of its parameter, but some callers have not
> initialized these parameters which will be read. And this patchset fixes
> these problems.

The core issue here seems to be that
brcmf_fil_{cmd,iovar,basscfg}_int_get() function (needlessly?) read
from *data.

So instead of forcing all callers of
brcmf_fil_{cmd,iovar,basscfg}_int_get() to initialize *data first, I
suggest changing brcmf_fil_{cmd,iovar,basscfg}_int_get() to just not
read from it.

I see no reason why they should care about what the previous value
was, since they are supposed to overwrite it anyway.

Best Regards,
Jonas
