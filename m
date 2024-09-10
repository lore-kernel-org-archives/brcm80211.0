Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C3C1AB51E
	for <brcm80211@lists.linux.dev>; Tue, 10 Sep 2024 21:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726005528; cv=none; b=YoLsKs8erxIxQ6nD/sqHtY7AsYJsTXk6Q83ldpohxxL577mATuS8DpqlE9+Yern5dFBMDLhGKdo+WpTwEIlcVcQSwAo1MHwM0DFOl0Z8Exhlg6TWFTvuDMZ1/93TTljW8sI4JuYvpCJi5OshtQiouAxCsmxphjbsLFi/rP1Pgy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726005528; c=relaxed/simple;
	bh=yePyIX59loL5NHGGJ//6Es5791hrIz8pgaK8x6ZDr90=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ivMdHst0ZCLy7N59fjgZpd7FOAhQh6aS3nXXKkT4mbtp1w53fBSlLaDkVUURd3bg/2KQbySOiCtFVCO1897D3r2HpinOjGF3BkLpb12cSYrEJYSVAVWt6sx4r+rcjZMc9susRW+HTOglFYahy4oe2FNnhdZW9B/YsgEUdJVjq34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJAhwd//; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJAhwd//"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2f025b94e07so50694371fa.0
        for <brcm80211@lists.linux.dev>; Tue, 10 Sep 2024 14:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726005523; x=1726610323; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cODp/cdYn+UoRP/+a8U5XTud5UdvhXKPRDpO/PLbOpI=;
        b=PJAhwd//c4InWXo5BZQm1FuN9zAfFuZSWiBijeJu/2Sq7tIQ/CrkjfYEP/D7de+jpt
         yI49pv3YYFoJrf4k881PjgITtsIswyqNoSuBHQ1aZwDotr4y4anfw1PB6dcZ/wemFEfk
         RpC49FuKWcJHG05V385cjzyor7IiowfTAeprI+2zagd0Z0IcuEuVPgGO4/342scA1T+O
         C8t0iQw9T7TR73elDmLdo4mnZ6/xd4/Ol8bbq1PT7JugI/fi2jgA0gKbCg0Sx5TmP1uN
         9XDXhzFZl6VSkcu0X3Dph0VSHcu6ST81wvLGnjIr5LxiEWS8hkhcu5twZJ1MXOdEVdsN
         flfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726005523; x=1726610323;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cODp/cdYn+UoRP/+a8U5XTud5UdvhXKPRDpO/PLbOpI=;
        b=NR3mKvAFxWnV7DEROQ1Jox3qCW4Xys1T7k4xXwVAGvYhO288XFhRw7v4r3uHk+OTUW
         QBgd3F3X3STa4sXq7X8VGmvD0qFcD009TybQw64ijZ7aNcPaRhUfYVjmTkwhePdpzjG6
         nBxvtsAeqbn8ZcrW1Z120+QbxWmjEhbllAjXYySEJNzJu8UPHPUpORmCMGV+DgJW71VI
         X+QcRV+9qg+B3O2OrOwCml4+1Mj6FDAU4kibnEChKaz0jdzQ2eMDSNyJxyc8kj5ay9ir
         cgWE/qq3QM9o2ePIEfVU+k3z2FedXdSwOfya41jbmLjVHd9AQ07HsoNDLpZo7/8FHGN2
         /cYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKiulRn3FvKQr6RYY0+Wsmz2RMy6JhMxqsliRRbSU0NG/fwB4KKxhmqbWION4dy0B9DidfkUQ2DA4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxijioa7Cz/VP+TvfWvomcL7lFs8L/vOapx4spuZ8wm2ULROGEC
	UWwk0NsrSTBbM2turXzditHMTdZgp3+5cwwromi1yawBqhSjwBgH
X-Google-Smtp-Source: AGHT+IEzf96KxSb2Nkf2s+XolsjlP30n8kQZLMRZDoTuxlRb5D00TYSZxadnElgwcvZowJSvPcdFTQ==
X-Received: by 2002:a2e:f0a:0:b0:2f3:a06a:4c5 with SMTP id 38308e7fff4ca-2f754a6b7cbmr67547291fa.29.1726005521995;
        Tue, 10 Sep 2024 14:58:41 -0700 (PDT)
Received: from vamoiridPC ([2a04:ee41:82:7577:5d47:19e4:3e71:414c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd5207csm4713747a12.47.2024.09.10.14.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 14:58:41 -0700 (PDT)
From: Vasileios Amoiridis <vassilisamir@gmail.com>
X-Google-Original-From: Vasileios Amoiridis <vamoirid@vamoiridPC>
Date: Tue, 10 Sep 2024 23:58:39 +0200
To: "Khan, Sabeeh" <sabeeh-khan@ti.com>
Cc: Vasileios Amoiridis <vassilisamir@gmail.com>,
	arend.vanspriel@broadcom.com, kvalo@kernel.org, knaerzche@gmail.com,
	leitao@debian.org, linus.walleij@linaro.org, javierm@redhat.com,
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless-next v2 3/3] wifi: wlcore: sdio: Use helper to
 define resources
Message-ID: <20240910215839.GB12725@vamoiridPC>
References: <20240904154919.118513-1-vassilisamir@gmail.com>
 <20240904154919.118513-4-vassilisamir@gmail.com>
 <c2886640-e342-4b2f-8c24-02c6edd901eb@ti.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c2886640-e342-4b2f-8c24-02c6edd901eb@ti.com>

On Mon, Sep 09, 2024 at 01:38:58PM +0400, Khan, Sabeeh wrote:
> Hi Vasileios,
> 
> On 9/4/2024 7:49 PM, Vasileios Amoiridis wrote:
> > Resources definition can become simpler and more organised by
> > using the dedicated helpers.
> >
> > Signed-off-by: Vasileios Amoiridis <vassilisamir@gmail.com>
> > ---
> >  drivers/net/wireless/ti/wlcore/sdio.c | 11 ++++-------
> >  1 file changed, 4 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/net/wireless/ti/wlcore/sdio.c b/drivers/net/wireless/ti/wlcore/sdio.c
> > index 9e1b644beba9..a73207bbe5d7 100644
> > --- a/drivers/net/wireless/ti/wlcore/sdio.c
> > +++ b/drivers/net/wireless/ti/wlcore/sdio.c
> > @@ -323,15 +323,12 @@ static int wl1271_probe(struct sdio_func *func,
> >  
> >  	memset(res, 0x00, sizeof(res));
> >  
> > -	res[0].start = irq;
> > -	res[0].flags = IORESOURCE_IRQ | irq_get_trigger_type(irq);
> > -	res[0].name = "irq";
> > -
> > +	res[0] = DEFINE_RES_IRQ_NAMED(irq, "irq");
> > +	res[0].flags |= irq_get_trigger_type(irq);
> >  
> >  	if (wakeirq > 0) {
> > -		res[1].start = wakeirq;
> > -		res[1].flags = IORESOURCE_IRQ | irq_get_trigger_type(wakeirq);
> > -		res[1].name = "wakeirq";
> > +		res[1] = DEFINE_RES_IRQ_NAMED(wakeirq, "wakeirq");
> > +		res[1].flags |= irq_get_trigger_type(wakeirq);
> >  		num_irqs = 2;
> >  	} else {
> >  		num_irqs = 1;
> 
> Tested-by: Sabeeh Khan <sabeeh-khan@ti.com>
> Reviewed-by: Sabeeh Khan <sabeeh-khan@ti.com>
> 

Hi Sabeeh,

Thank you very much!

Cheers,
Vasilis
